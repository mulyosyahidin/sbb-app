import 'package:app/core/services/device_id_service.dart';
import 'package:app/core/services/fcm_service.dart';
import 'package:app/core/utils/toast.dart';
import 'package:app/features/user_device/data/repositories/user_device_repository_impl.dart';
import 'package:app/features/user_device/data/requests/create_user_device_request.dart';
import 'package:app/features/user_device/domain/entity/user_device.dart';
import 'package:app/features/user_device/domain/repositories/user_device_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_device_controller.g.dart';

@riverpod
class UserDeviceController extends _$UserDeviceController {
  UserDeviceRepository get _repository => ref.watch(userDeviceRepositoryProvider);
  
  @override
  AsyncValue<UserDevice?> build() {
    return AsyncData(_repository.getLocalDevice());
  }

  Future<void> registerDevice(BuildContext context) async {
    final previousState = state;
    state = const AsyncLoading();

    try {
      final fcmToken = await ref.read(fetchFcmTokenProvider.future);
      final deviceId = await ref.read(fetchDeviceIdProvider.future);
      final details = await ref.read(fetchDeviceDetailsProvider.future);

      if (fcmToken == null || deviceId == null) {
        throw Exception('Failed to get required device information');
      }

      final request = CreateUserDeviceRequest(
        fcmToken: fcmToken,
        deviceId: deviceId,
        deviceBrand: details['brand'] ?? 'Unknown',
        deviceModel: details['model'] ?? 'Unknown',
        osBuildId: details['os_build_id'] ?? 'Unknown',
        osVersion: details['os_version'] ?? 'Unknown',
      );

      final result = await _repository.createUserDevice(request);

      await _repository.saveLocalDevice(result);

      if (context.mounted) {
        ToastUtils.showSuccess(
          context,
          title: 'Success',
          description: 'Device registered successfully',
        );
      }

      state = AsyncData(result);
    } catch (e) {
      if (context.mounted) {
        ToastUtils.showError(
          context,
          title: 'Registration Failed',
          description: e.toString(),
        );
      }

      state = previousState;
    }
  }

  Future<void> unregisterDevice(BuildContext context) async {
    final previousState = state;
    final currentDevice = state.value;
    if (currentDevice == null) return;

    state = const AsyncLoading();

    try {
      await _repository.unregisterDevice(currentDevice.id);
      await _repository.clearLocalDevice();

      if (context.mounted) {
        ToastUtils.showSuccess(
          context,
          title: 'Success',
          description: 'Device removed successfully',
        );
      }

      state = const AsyncData(null);
    } catch (e) {
      if (context.mounted) {
        ToastUtils.showError(
          context,
          title: 'Action Failed',
          description: e.toString(),
        );
      }
      
      state = previousState;
    }
  }
}
