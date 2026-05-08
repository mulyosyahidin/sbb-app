class UserDevice {
  final int id;
  final String deviceId;
  final String deviceBrand;
  final String deviceModel;
  final String osVersion;
  final String osBuildId;
  final String status;

  const UserDevice({
    required this.id,
    required this.deviceId,
    required this.deviceBrand,
    required this.deviceModel,
    required this.osVersion,
    required this.osBuildId,
    required this.status,
  });
}
