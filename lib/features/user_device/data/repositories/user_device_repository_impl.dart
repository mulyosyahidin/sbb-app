import 'package:app/core/utils/error.dart';
import 'package:app/features/user_device/data/datasources/user_device_local_datasource.dart';
import 'package:app/features/user_device/data/datasources/user_device_remote_datasource.dart';
import 'package:app/features/user_device/data/dtos/user_device_dto.dart';
import 'package:app/features/user_device/data/mappers/user_device_mapper.dart';
import 'package:app/features/user_device/data/requests/create_user_device_request.dart';
import 'package:app/features/user_device/domain/entity/user_device.dart';
import 'package:app/features/user_device/domain/repositories/user_device_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_device_repository_impl.g.dart';

class UserDeviceRepositoryImpl implements UserDeviceRepository {
  final UserDeviceRemoteDatasource _userDeviceRemoteDatasource;
  final UserDeviceLocalDatasource _userDeviceLocalDatasource;

  UserDeviceRepositoryImpl(
      this._userDeviceRemoteDatasource, this._userDeviceLocalDatasource);

  @override
  Future<UserDevice> createUserDevice(
      CreateUserDeviceRequest createUserDeviceRequest) async {
    try {
      final response = await _userDeviceRemoteDatasource
          .createUserDevice(createUserDeviceRequest);

      if (!response.success) {
        throw response.toException();
      }

      return UserDeviceMapper.toEntity(response.data!.userDevice);
    } catch (e) {
      throw ErrorUtil.handleRepositoryException(e, 'UserDeviceRepositoryImpl');
    }
  }

  @override
  Future<void> unregisterDevice(String id) async {
    try {
      await _userDeviceRemoteDatasource.unregisterDevice(id);
    } catch (e) {
      throw ErrorUtil.handleRepositoryException(e, 'UserDeviceRepositoryImpl');
    }
  }

  @override
  Future<void> saveLocalDevice(UserDevice device) async {
    final dto = UserDeviceDto(
      id: device.id,
      fcmToken: device.fcmToken,
      deviceId: device.deviceId,
      deviceBrand: device.deviceBrand,
      deviceModel: device.deviceModel,
      osVersion: device.osVersion,
      osBuildId: device.osBuildId,
    );
    await _userDeviceLocalDatasource.saveUserDevice(dto);
  }

  @override
  UserDevice? getLocalDevice() {
    final dto = _userDeviceLocalDatasource.getUserDevice();
    if (dto == null) return null;
    return UserDeviceMapper.toEntity(dto);
  }

  @override
  Future<void> clearLocalDevice() async {
    await _userDeviceLocalDatasource.deleteUserDevice();
  }
}

@riverpod
UserDeviceRepository userDeviceRepository(Ref ref) {
  return UserDeviceRepositoryImpl(
    ref.watch(userDeviceRemoteDatasourceProvider),
    ref.watch(userDeviceLocalDatasourceProvider),
  );
}
