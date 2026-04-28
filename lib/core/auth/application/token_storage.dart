import 'dart:convert';

import 'package:app/core/auth/data/dtos/user_dto.dart';
import 'package:app/core/auth/data/mappers/user_mapper.dart';
import 'package:app/core/auth/domain/entities/user.dart';
import 'package:app/core/data/dtos/user_device_dto.dart';
import 'package:app/core/data/mappers/user_device_mapper.dart';
import 'package:app/core/domain/entities/user_device.dart';
import 'package:app/core/providers/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage.g.dart';

class TokenStorage {
  final FlutterSecureStorage _flutterSecureStorage;

  TokenStorage(this._flutterSecureStorage);

  static const _userKey = "user_data";
  static const _accessTokenKey = "access_token_data";
  static const _deviceKey = "device_data";

  Future<void> saveAccessToken(String accessToken) async {
    await _flutterSecureStorage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return await _flutterSecureStorage.read(key: _accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    await _flutterSecureStorage.delete(key: _accessTokenKey);
  }

  Future<void> saveUser(User user) async {
    final userDto = UserMapper.toDto(user);
    final jsonString = jsonEncode(
      userDto.toJson(),
    );

    await _flutterSecureStorage.write(key: _userKey, value: jsonString);
  }

  Future<User?> getUser() async {
    final jsonString = await _flutterSecureStorage.read(key: _userKey);
    if (jsonString == null) {
      return null;
    }

    final userDto = UserDto.fromJson(
      jsonDecode(jsonString),
    );
    return UserMapper.toEntity(userDto);
  }

  Future<void> deleteUser() async {
    await _flutterSecureStorage.delete(key: _userKey);
  }

  Future<void> saveDevice(UserDevice userDevice) async {
    final userDeviceDto = UserDeviceMapper.toDto(userDevice);
    final jsonString = jsonEncode(
      userDeviceDto.toJson(),
    );

    await _flutterSecureStorage.write(key: _deviceKey, value: jsonString);
  }

  Future<UserDevice?> getDevice() async {
    final jsonString = await _flutterSecureStorage.read(key: _deviceKey);
    if (jsonString == null) {
      return null;
    }

    final userDeviceDto = UserDeviceDto.fromJson(
      jsonDecode(jsonString),
    );
    return UserDeviceMapper.toEntity(userDeviceDto);
  }

  Future<void> deleteDevice() async {
    await _flutterSecureStorage.delete(key: _deviceKey);
  }

  Future<void> clearAll() async {
    await _flutterSecureStorage.deleteAll();
  }
}

@Riverpod(keepAlive: true)
TokenStorage tokenStorage(Ref ref) {
  return TokenStorage(
    ref.watch(flutterSecureStorageProvider),
  );
}
