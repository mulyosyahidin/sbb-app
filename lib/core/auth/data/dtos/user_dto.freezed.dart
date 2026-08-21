// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDto {
  int get id;
  String get name;
  String get email;
  int? get profilePictureFileId;
  String? get role;
  String? get profilePictureUrl;
  String? get driver;
  DateTime? get emailVerifiedAt;
  DateTime? get twoFactorConfirmedAt;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<UserDto> get copyWith =>
      _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePictureFileId, profilePictureFileId) ||
                other.profilePictureFileId == profilePictureFileId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.twoFactorConfirmedAt, twoFactorConfirmedAt) ||
                other.twoFactorConfirmedAt == twoFactorConfirmedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      profilePictureFileId,
      role,
      profilePictureUrl,
      driver,
      emailVerifiedAt,
      twoFactorConfirmedAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, email: $email, profilePictureFileId: $profilePictureFileId, role: $role, profilePictureUrl: $profilePictureUrl, driver: $driver, emailVerifiedAt: $emailVerifiedAt, twoFactorConfirmedAt: $twoFactorConfirmedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) =
      _$UserDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      int? profilePictureFileId,
      String? role,
      String? profilePictureUrl,
      String? driver,
      DateTime? emailVerifiedAt,
      DateTime? twoFactorConfirmedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profilePictureFileId = freezed,
    Object? role = freezed,
    Object? profilePictureUrl = freezed,
    Object? driver = freezed,
    Object? emailVerifiedAt = freezed,
    Object? twoFactorConfirmedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureFileId: freezed == profilePictureFileId
          ? _self.profilePictureFileId
          : profilePictureFileId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _self.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      driver: freezed == driver
          ? _self.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      twoFactorConfirmedAt: freezed == twoFactorConfirmedAt
          ? _self.twoFactorConfirmedAt
          : twoFactorConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDto implements UserDto {
  const _UserDto(
      {required this.id,
      required this.name,
      required this.email,
      this.profilePictureFileId,
      this.role,
      this.profilePictureUrl,
      this.driver,
      this.emailVerifiedAt,
      this.twoFactorConfirmedAt,
      required this.createdAt,
      required this.updatedAt});
  factory _UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final int? profilePictureFileId;
  @override
  final String? role;
  @override
  final String? profilePictureUrl;
  @override
  final String? driver;
  @override
  final DateTime? emailVerifiedAt;
  @override
  final DateTime? twoFactorConfirmedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePictureFileId, profilePictureFileId) ||
                other.profilePictureFileId == profilePictureFileId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.twoFactorConfirmedAt, twoFactorConfirmedAt) ||
                other.twoFactorConfirmedAt == twoFactorConfirmedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      profilePictureFileId,
      role,
      profilePictureUrl,
      driver,
      emailVerifiedAt,
      twoFactorConfirmedAt,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, email: $email, profilePictureFileId: $profilePictureFileId, role: $role, profilePictureUrl: $profilePictureUrl, driver: $driver, emailVerifiedAt: $emailVerifiedAt, twoFactorConfirmedAt: $twoFactorConfirmedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) =
      __$UserDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      int? profilePictureFileId,
      String? role,
      String? profilePictureUrl,
      String? driver,
      DateTime? emailVerifiedAt,
      DateTime? twoFactorConfirmedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profilePictureFileId = freezed,
    Object? role = freezed,
    Object? profilePictureUrl = freezed,
    Object? driver = freezed,
    Object? emailVerifiedAt = freezed,
    Object? twoFactorConfirmedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_UserDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureFileId: freezed == profilePictureFileId
          ? _self.profilePictureFileId
          : profilePictureFileId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _self.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      driver: freezed == driver
          ? _self.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      twoFactorConfirmedAt: freezed == twoFactorConfirmedAt
          ? _self.twoFactorConfirmedAt
          : twoFactorConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
