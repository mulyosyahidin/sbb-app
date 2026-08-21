// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterRequestDto {
  String get name;
  String get email;
  String get password;
  String get passwordConfirmation;
  String get fcmToken;
  String get deviceId;
  String get deviceBrand;
  String get deviceModel;
  String get osBuildId;
  String get osVersion;

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterRequestDtoCopyWith<RegisterRequestDto> get copyWith =>
      _$RegisterRequestDtoCopyWithImpl<RegisterRequestDto>(
          this as RegisterRequestDto, _$identity);

  /// Serializes this RegisterRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      password,
      passwordConfirmation,
      fcmToken,
      deviceId,
      deviceBrand,
      deviceModel,
      osBuildId,
      osVersion);

  @override
  String toString() {
    return 'RegisterRequestDto(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, fcmToken: $fcmToken, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osBuildId: $osBuildId, osVersion: $osVersion)';
  }
}

/// @nodoc
abstract mixin class $RegisterRequestDtoCopyWith<$Res> {
  factory $RegisterRequestDtoCopyWith(
          RegisterRequestDto value, $Res Function(RegisterRequestDto) _then) =
      _$RegisterRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String passwordConfirmation,
      String fcmToken,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osBuildId,
      String osVersion});
}

/// @nodoc
class _$RegisterRequestDtoCopyWithImpl<$Res>
    implements $RegisterRequestDtoCopyWith<$Res> {
  _$RegisterRequestDtoCopyWithImpl(this._self, this._then);

  final RegisterRequestDto _self;
  final $Res Function(RegisterRequestDto) _then;

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osBuildId = null,
    Object? osVersion = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _self.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
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
class _RegisterRequestDto implements RegisterRequestDto {
  const _RegisterRequestDto(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation,
      required this.fcmToken,
      required this.deviceId,
      required this.deviceBrand,
      required this.deviceModel,
      required this.osBuildId,
      required this.osVersion});
  factory _RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;
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

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterRequestDtoCopyWith<_RegisterRequestDto> get copyWith =>
      __$RegisterRequestDtoCopyWithImpl<_RegisterRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      password,
      passwordConfirmation,
      fcmToken,
      deviceId,
      deviceBrand,
      deviceModel,
      osBuildId,
      osVersion);

  @override
  String toString() {
    return 'RegisterRequestDto(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, fcmToken: $fcmToken, deviceId: $deviceId, deviceBrand: $deviceBrand, deviceModel: $deviceModel, osBuildId: $osBuildId, osVersion: $osVersion)';
  }
}

/// @nodoc
abstract mixin class _$RegisterRequestDtoCopyWith<$Res>
    implements $RegisterRequestDtoCopyWith<$Res> {
  factory _$RegisterRequestDtoCopyWith(
          _RegisterRequestDto value, $Res Function(_RegisterRequestDto) _then) =
      __$RegisterRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String passwordConfirmation,
      String fcmToken,
      String deviceId,
      String deviceBrand,
      String deviceModel,
      String osBuildId,
      String osVersion});
}

/// @nodoc
class __$RegisterRequestDtoCopyWithImpl<$Res>
    implements _$RegisterRequestDtoCopyWith<$Res> {
  __$RegisterRequestDtoCopyWithImpl(this._self, this._then);

  final _RegisterRequestDto _self;
  final $Res Function(_RegisterRequestDto) _then;

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceBrand = null,
    Object? deviceModel = null,
    Object? osBuildId = null,
    Object? osVersion = null,
  }) {
    return _then(_RegisterRequestDto(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _self.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
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
