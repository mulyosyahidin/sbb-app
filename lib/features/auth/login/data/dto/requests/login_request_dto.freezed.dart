// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequestDto {
  String get email;
  String get password;
  String get fcmToken;
  String get deviceId;
  String get deviceBrand;
  String get deviceModel;
  String get osBuildId;
  String get osVersion;

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginRequestDtoCopyWith<LoginRequestDto> get copyWith =>
      _$LoginRequestDtoCopyWithImpl<LoginRequestDto>(
          this as LoginRequestDto, _$identity);

  /// Serializes this LoginRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginRequestDto &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
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
  int get hashCode => Object.hash(runtimeType, email, password, fcmToken,
      deviceId, deviceBrand, deviceModel, osBuildId, osVersion);

  @override
  String toString() {
    return 'LoginRequestDto(email: $email, password: $password, fcmToken: $fcmToken, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osBuildId: $osBuildId, osVersion: $osVersion)';
  }
}

/// @nodoc
abstract mixin class $LoginRequestDtoCopyWith<$Res> {
  factory $LoginRequestDtoCopyWith(
          LoginRequestDto value, $Res Function(LoginRequestDto) _then) =
      _$LoginRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      String fcmToken,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osBuildId,
      String osVersion});
}

/// @nodoc
class _$LoginRequestDtoCopyWithImpl<$Res>
    implements $LoginRequestDtoCopyWith<$Res> {
  _$LoginRequestDtoCopyWithImpl(this._self, this._then);

  final LoginRequestDto _self;
  final $Res Function(LoginRequestDto) _then;

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osBuildId = null,
    Object? osVersion = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
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
class _LoginRequestDto implements LoginRequestDto {
  const _LoginRequestDto(
      {required this.email,
      required this.password,
      required this.fcmToken,
      required this.deviceId,
      required this.deviceBrand,
      required this.deviceModel,
      required this.osBuildId,
      required this.osVersion});
  factory _LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  @override
  final String email;
  @override
  final String password;
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

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginRequestDtoCopyWith<_LoginRequestDto> get copyWith =>
      __$LoginRequestDtoCopyWithImpl<_LoginRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginRequestDto &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
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
  int get hashCode => Object.hash(runtimeType, email, password, fcmToken,
      deviceId, deviceBrand, deviceModel, osBuildId, osVersion);

  @override
  String toString() {
    return 'LoginRequestDto(email: $email, password: $password, fcmToken: $fcmToken, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osBuildId: $osBuildId, osVersion: $osVersion)';
  }
}

/// @nodoc
abstract mixin class _$LoginRequestDtoCopyWith<$Res>
    implements $LoginRequestDtoCopyWith<$Res> {
  factory _$LoginRequestDtoCopyWith(
          _LoginRequestDto value, $Res Function(_LoginRequestDto) _then) =
      __$LoginRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String fcmToken,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osBuildId,
      String osVersion});
}

/// @nodoc
class __$LoginRequestDtoCopyWithImpl<$Res>
    implements _$LoginRequestDtoCopyWith<$Res> {
  __$LoginRequestDtoCopyWithImpl(this._self, this._then);

  final _LoginRequestDto _self;
  final $Res Function(_LoginRequestDto) _then;

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osBuildId = null,
    Object? osVersion = null,
  }) {
    return _then(_LoginRequestDto(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
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
