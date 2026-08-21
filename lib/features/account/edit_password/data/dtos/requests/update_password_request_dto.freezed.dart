// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_password_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePasswordRequestDto {
  String get currentPassword;
  String get newPassword;
  String get newPasswordConfirmation;

  /// Create a copy of UpdatePasswordRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordRequestDtoCopyWith<UpdatePasswordRequestDto> get copyWith =>
      _$UpdatePasswordRequestDtoCopyWithImpl<UpdatePasswordRequestDto>(
          this as UpdatePasswordRequestDto, _$identity);

  /// Serializes this UpdatePasswordRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordRequestDto &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.newPasswordConfirmation, newPasswordConfirmation) ||
                other.newPasswordConfirmation == newPasswordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPassword, newPassword, newPasswordConfirmation);

  @override
  String toString() {
    return 'UpdatePasswordRequestDto(currentPassword: $currentPassword, newPassword: $newPassword, newPasswordConfirmation: $newPasswordConfirmation)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordRequestDtoCopyWith<$Res> {
  factory $UpdatePasswordRequestDtoCopyWith(UpdatePasswordRequestDto value,
          $Res Function(UpdatePasswordRequestDto) _then) =
      _$UpdatePasswordRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String currentPassword,
      String newPassword,
      String newPasswordConfirmation});
}

/// @nodoc
class _$UpdatePasswordRequestDtoCopyWithImpl<$Res>
    implements $UpdatePasswordRequestDtoCopyWith<$Res> {
  _$UpdatePasswordRequestDtoCopyWithImpl(this._self, this._then);

  final UpdatePasswordRequestDto _self;
  final $Res Function(UpdatePasswordRequestDto) _then;

  /// Create a copy of UpdatePasswordRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? newPasswordConfirmation = null,
  }) {
    return _then(_self.copyWith(
      currentPassword: null == currentPassword
          ? _self.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirmation: null == newPasswordConfirmation
          ? _self.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdatePasswordRequestDto implements UpdatePasswordRequestDto {
  const _UpdatePasswordRequestDto(
      {required this.currentPassword,
      required this.newPassword,
      required this.newPasswordConfirmation});
  factory _UpdatePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestDtoFromJson(json);

  @override
  final String currentPassword;
  @override
  final String newPassword;
  @override
  final String newPasswordConfirmation;

  /// Create a copy of UpdatePasswordRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatePasswordRequestDtoCopyWith<_UpdatePasswordRequestDto> get copyWith =>
      __$UpdatePasswordRequestDtoCopyWithImpl<_UpdatePasswordRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdatePasswordRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePasswordRequestDto &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.newPasswordConfirmation, newPasswordConfirmation) ||
                other.newPasswordConfirmation == newPasswordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPassword, newPassword, newPasswordConfirmation);

  @override
  String toString() {
    return 'UpdatePasswordRequestDto(currentPassword: $currentPassword, newPassword: $newPassword, newPasswordConfirmation: $newPasswordConfirmation)';
  }
}

/// @nodoc
abstract mixin class _$UpdatePasswordRequestDtoCopyWith<$Res>
    implements $UpdatePasswordRequestDtoCopyWith<$Res> {
  factory _$UpdatePasswordRequestDtoCopyWith(_UpdatePasswordRequestDto value,
          $Res Function(_UpdatePasswordRequestDto) _then) =
      __$UpdatePasswordRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String currentPassword,
      String newPassword,
      String newPasswordConfirmation});
}

/// @nodoc
class __$UpdatePasswordRequestDtoCopyWithImpl<$Res>
    implements _$UpdatePasswordRequestDtoCopyWith<$Res> {
  __$UpdatePasswordRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdatePasswordRequestDto _self;
  final $Res Function(_UpdatePasswordRequestDto) _then;

  /// Create a copy of UpdatePasswordRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? newPasswordConfirmation = null,
  }) {
    return _then(_UpdatePasswordRequestDto(
      currentPassword: null == currentPassword
          ? _self.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirmation: null == newPasswordConfirmation
          ? _self.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
