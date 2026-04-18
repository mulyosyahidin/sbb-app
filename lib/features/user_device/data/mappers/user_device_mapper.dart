import 'package:app/features/user_device/data/dtos/user_device_dto.dart';
import 'package:app/features/user_device/domain/entity/user_device.dart';

class UserDeviceMapper {
  static UserDevice toEntity(UserDeviceDto dto) {
    return UserDevice(
      id: dto.id,
      deviceId: dto.deviceId,
      fcmToken: dto.fcmToken,
      deviceBrand: dto.deviceBrand,
      deviceModel: dto.deviceModel,
      osVersion: dto.osVersion,
      osBuildId: dto.osBuildId,
    );
  }
}