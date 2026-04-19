import 'package:app/core/data/dtos/user_device_dto.dart';
import 'package:app/core/domain/entities/user_device.dart';

class UserDeviceMapper {
  static UserDevice toEntity(UserDeviceDto dto) {
    return UserDevice(
      id: dto.id,
      deviceId: dto.deviceId,
      deviceBrand: dto.deviceBrand,
      deviceModel: dto.deviceModel,
      osVersion: dto.osVersion,
      osBuildId: dto.osBuildId,
      status: dto.status,
    );
  }

  static UserDeviceDto toDto(UserDevice userDevice) {
    return UserDeviceDto(
      id: userDevice.id,
      deviceId: userDevice.deviceId,
      deviceBrand: userDevice.deviceBrand,
      deviceModel: userDevice.deviceModel,
      osVersion: userDevice.osVersion,
      osBuildId: userDevice.osBuildId,
      status: userDevice.status,
    );
  }
}