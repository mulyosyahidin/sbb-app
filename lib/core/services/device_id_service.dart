import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_id_service.g.dart';

class DeviceIdService {
  final _androidId = const AndroidId();
  final _deviceInfo = DeviceInfoPlugin();

  Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      return await _androidId.getId();
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return null;
  }

  Future<Map<String, dynamic>> getDeviceDetails() async {
    if (Platform.isAndroid) {
      final build = await _deviceInfo.androidInfo;
      return {
        'brand': build.brand,
        'device': build.device,
        'model': build.model,
        'os_version': build.version.release,
        'os_build_id': build.id,
      };
    } else if (Platform.isIOS) {
      final data = await _deviceInfo.iosInfo;
      return {
        'brand': 'Apple',
        'device': data.name,
        'model': data.model,
        'os_version': data.systemVersion,
        'os_build_id': data.systemName,
      };
    }
    return {};
  }
}

@Riverpod(keepAlive: true)
DeviceIdService deviceIdService(Ref ref) {
  return DeviceIdService();
}

@riverpod
Future<String?> fetchDeviceId(Ref ref) {
  return ref.watch(deviceIdServiceProvider).getDeviceId();
}

@riverpod
Future<Map<String, dynamic>> fetchDeviceDetails(Ref ref) {
  return ref.watch(deviceIdServiceProvider).getDeviceDetails();
}
