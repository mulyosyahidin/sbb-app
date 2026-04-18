class UserDevice {
  final String id;
  final String fcmToken;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  final String osVersion;
  final String osBuildId;

  const UserDevice({
    required this.id,
    required this.fcmToken,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.osVersion,
    required this.osBuildId,
  });
}
