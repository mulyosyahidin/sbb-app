// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDeviceDto {
  String get id;
  String get deviceId;
  String get deviceBrand;
  String get deviceModel;
  String get osVersion;
  String get osBuildId;
  String get status;

  /// Create a copy of UserDeviceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDeviceDtoCopyWith<UserDeviceDto> get copyWith =>
      _$UserDeviceDtoCopyWithImpl<UserDeviceDto>(
          this as UserDeviceDto, _$identity);

  /// Serializes this UserDeviceDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDeviceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceBrand, deviceBrand) ||
                other.deviceBrand == deviceBrand) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.osBuildId, osBuildId) ||
                other.osBuildId == osBuildId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, deviceBrand,
      deviceModel, osVersion, osBuildId, status);

  @override
  String toString() {
    return 'UserDeviceDto(id: $id, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osVersion: $osVersion, osBuildId: $osBuildId, status: $status)';
  }
}

/// @nodoc
abstract mixin class $UserDeviceDtoCopyWith<$Res> {
  factory $UserDeviceDtoCopyWith(
          UserDeviceDto value, $Res Function(UserDeviceDto) _then) =
      _$UserDeviceDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osVersion,
      String osBuildId,
      String status});
}

/// @nodoc
class _$UserDeviceDtoCopyWithImpl<$Res>
    implements $UserDeviceDtoCopyWith<$Res> {
  _$UserDeviceDtoCopyWithImpl(this._self, this._then);

  final UserDeviceDto _self;
  final $Res Function(UserDeviceDto) _then;

  /// Create a copy of UserDeviceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osVersion = null,
    Object? osBuildId = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceBrand: null == deviceBrand
          ? _self.deviceBrand
          : deviceBrand // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _self.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      osBuildId: null == osBuildId
          ? _self.osBuildId
          : osBuildId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDeviceDto implements UserDeviceDto {
  const _UserDeviceDto(
      {required this.id,
      required this.deviceId,
      required this.deviceBrand,
      required this.deviceModel,
      required this.osVersion,
      required this.osBuildId,
      required this.status});
  factory _UserDeviceDto.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceDtoFromJson(json);

  @override
  final String id;
  @override
  final String deviceId;
  @override
  final String deviceBrand;
  @override
  final String deviceModel;
  @override
  final String osVersion;
  @override
  final String osBuildId;
  @override
  final String status;

  /// Create a copy of UserDeviceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDeviceDtoCopyWith<_UserDeviceDto> get copyWith =>
      __$UserDeviceDtoCopyWithImpl<_UserDeviceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDeviceDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDeviceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceBrand, deviceBrand) ||
                other.deviceBrand == deviceBrand) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.osBuildId, osBuildId) ||
                other.osBuildId == osBuildId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, deviceId, deviceBrand,
      deviceModel, osVersion, osBuildId, status);

  @override
  String toString() {
    return 'UserDeviceDto(id: $id, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osVersion: $osVersion, osBuildId: $osBuildId, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$UserDeviceDtoCopyWith<$Res>
    implements $UserDeviceDtoCopyWith<$Res> {
  factory _$UserDeviceDtoCopyWith(
          _UserDeviceDto value, $Res Function(_UserDeviceDto) _then) =
      __$UserDeviceDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osVersion,
      String osBuildId,
      String status});
}

/// @nodoc
class __$UserDeviceDtoCopyWithImpl<$Res>
    implements _$UserDeviceDtoCopyWith<$Res> {
  __$UserDeviceDtoCopyWithImpl(this._self, this._then);

  final _UserDeviceDto _self;
  final $Res Function(_UserDeviceDto) _then;

  /// Create a copy of UserDeviceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osVersion = null,
    Object? osBuildId = null,
    Object? status = null,
  }) {
    return _then(_UserDeviceDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceBrand: null == deviceBrand
          ? _self.deviceBrand
          : deviceBrand // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _self.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      osBuildId: null == osBuildId
          ? _self.osBuildId
          : osBuildId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
