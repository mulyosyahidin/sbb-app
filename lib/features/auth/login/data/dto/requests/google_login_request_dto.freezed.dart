// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_login_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleLoginRequestDto {
  String get idToken;
  String get fcmToken;
  String get deviceId;
  String get deviceBrand;
  String get deviceModel;
  String get osBuildId;
  String get osVersion;

  /// Create a copy of GoogleLoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoogleLoginRequestDtoCopyWith<GoogleLoginRequestDto> get copyWith =>
      _$GoogleLoginRequestDtoCopyWithImpl<GoogleLoginRequestDto>(
          this as GoogleLoginRequestDto, _$identity);

  /// Serializes this GoogleLoginRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoogleLoginRequestDto &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceBrand, deviceBrand) ||
                other.deviceBrand == deviceBrand) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.osBuildId, osBuildId) ||
                other.osBuildId == osBuildId) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken, fcmToken, deviceId,
      deviceBrand, deviceModel, osBuildId, osVersion);

  @override
  String toString() {
    return 'GoogleLoginRequestDto(idToken: $idToken, fcmToken: $fcmToken, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osBuildId: $osBuildId, osVersion: $osVersion)';
  }
}

/// @nodoc
abstract mixin class $GoogleLoginRequestDtoCopyWith<$Res> {
  factory $GoogleLoginRequestDtoCopyWith(GoogleLoginRequestDto value,
          $Res Function(GoogleLoginRequestDto) _then) =
      _$GoogleLoginRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String idToken,
      String fcmToken,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osBuildId,
      String osVersion});
}

/// @nodoc
class _$GoogleLoginRequestDtoCopyWithImpl<$Res>
    implements $GoogleLoginRequestDtoCopyWith<$Res> {
  _$GoogleLoginRequestDtoCopyWithImpl(this._self, this._then);

  final GoogleLoginRequestDto _self;
  final $Res Function(GoogleLoginRequestDto) _then;

  /// Create a copy of GoogleLoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osBuildId = null,
    Object? osVersion = null,
  }) {
    return _then(_self.copyWith(
      idToken: null == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
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
      osBuildId: null == osBuildId
          ? _self.osBuildId
          : osBuildId // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GoogleLoginRequestDto implements GoogleLoginRequestDto {
  const _GoogleLoginRequestDto(
      {required this.idToken,
      required this.fcmToken,
      required this.deviceId,
      required this.deviceBrand,
      required this.deviceModel,
      required this.osBuildId,
      required this.osVersion});
  factory _GoogleLoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestDtoFromJson(json);

  @override
  final String idToken;
  @override
  final String fcmToken;
  @override
  final String deviceId;
  @override
  final String deviceBrand;
  @override
  final String deviceModel;
  @override
  final String osBuildId;
  @override
  final String osVersion;

  /// Create a copy of GoogleLoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GoogleLoginRequestDtoCopyWith<_GoogleLoginRequestDto> get copyWith =>
      __$GoogleLoginRequestDtoCopyWithImpl<_GoogleLoginRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GoogleLoginRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoogleLoginRequestDto &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceBrand, deviceBrand) ||
                other.deviceBrand == deviceBrand) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.osBuildId, osBuildId) ||
                other.osBuildId == osBuildId) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken, fcmToken, deviceId,
      deviceBrand, deviceModel, osBuildId, osVersion);

  @override
  String toString() {
    return 'GoogleLoginRequestDto(idToken: $idToken, fcmToken: $fcmToken, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osBuildId: $osBuildId, osVersion: $osVersion)';
  }
}

/// @nodoc
abstract mixin class _$GoogleLoginRequestDtoCopyWith<$Res>
    implements $GoogleLoginRequestDtoCopyWith<$Res> {
  factory _$GoogleLoginRequestDtoCopyWith(_GoogleLoginRequestDto value,
          $Res Function(_GoogleLoginRequestDto) _then) =
      __$GoogleLoginRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String idToken,
      String fcmToken,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osBuildId,
      String osVersion});
}

/// @nodoc
class __$GoogleLoginRequestDtoCopyWithImpl<$Res>
    implements _$GoogleLoginRequestDtoCopyWith<$Res> {
  __$GoogleLoginRequestDtoCopyWithImpl(this._self, this._then);

  final _GoogleLoginRequestDto _self;
  final $Res Function(_GoogleLoginRequestDto) _then;

  /// Create a copy of GoogleLoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idToken = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osBuildId = null,
    Object? osVersion = null,
  }) {
    return _then(_GoogleLoginRequestDto(
      idToken: null == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
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
      osBuildId: null == osBuildId
          ? _self.osBuildId
          : osBuildId // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _self.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
