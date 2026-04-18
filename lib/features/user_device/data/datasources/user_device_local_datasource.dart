import 'dart:convert';
import 'package:app/core/providers/shared_preferences_provider.dart';
import 'package:app/features/user_device/data/dtos/user_device_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_device_local_datasource.g.dart';

class UserDeviceLocalDatasource {
  final SharedPreferences _prefs;
  static const String _key = 'registered_device';

  UserDeviceLocalDatasource(this._prefs);

  Future<void> saveUserDevice(UserDeviceDto device) async {
    final jsonString = jsonEncode(device.toJson());
    await _prefs.setString(_key, jsonString);
  }

  UserDeviceDto? getUserDevice() {
    final jsonString = _prefs.getString(_key);
    if (jsonString == null) return null;
    try {
      return UserDeviceDto.fromJson(jsonDecode(jsonString));
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteUserDevice() async {
    await _prefs.remove(_key);
  }
}

@riverpod
UserDeviceLocalDatasource userDeviceLocalDatasource(Ref ref) {
  return UserDeviceLocalDatasource(ref.watch(sharedPreferencesProvider));
}
