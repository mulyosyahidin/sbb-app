import 'package:app/features/user_device/data/requests/create_user_device_request.dart';
import 'package:app/features/user_device/domain/entity/user_device.dart';

abstract class UserDeviceRepository {
  Future<UserDevice> createUserDevice(CreateUserDeviceRequest createUserDeviceRequest);
  Future<void> unregisterDevice(String id);
  
  // Local storage methods
  Future<void> saveLocalDevice(UserDevice device);
  UserDevice? getLocalDevice();
  Future<void> clearLocalDevice();
}
