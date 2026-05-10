// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProfileRequestDto {
  String get name;
  String get email;

  /// Create a copy of UpdateProfileRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProfileRequestDtoCopyWith<UpdateProfileRequestDto> get copyWith =>
      _$UpdateProfileRequestDtoCopyWithImpl<UpdateProfileRequestDto>(
          this as UpdateProfileRequestDto, _$identity);

  /// Serializes this UpdateProfileRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProfileRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  @override
  String toString() {
    return 'UpdateProfileRequestDto(name: $name, email: $email)';
  }
}

/// @nodoc
abstract mixin class $UpdateProfileRequestDtoCopyWith<$Res> {
  factory $UpdateProfileRequestDtoCopyWith(UpdateProfileRequestDto value,
          $Res Function(UpdateProfileRequestDto) _then) =
      _$UpdateProfileRequestDtoCopyWithImpl;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class _$UpdateProfileRequestDtoCopyWithImpl<$Res>
    implements $UpdateProfileRequestDtoCopyWith<$Res> {
  _$UpdateProfileRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateProfileRequestDto _self;
  final $Res Function(UpdateProfileRequestDto) _then;

  /// Create a copy of UpdateProfileRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateProfileRequestDto implements UpdateProfileRequestDto {
  const _UpdateProfileRequestDto({required this.name, required this.email});
  factory _UpdateProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestDtoFromJson(json);

  @override
  final String name;
  @override
  final String email;

  /// Create a copy of UpdateProfileRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProfileRequestDtoCopyWith<_UpdateProfileRequestDto> get copyWith =>
      __$UpdateProfileRequestDtoCopyWithImpl<_UpdateProfileRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateProfileRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfileRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  @override
  String toString() {
    return 'UpdateProfileRequestDto(name: $name, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProfileRequestDtoCopyWith<$Res>
    implements $UpdateProfileRequestDtoCopyWith<$Res> {
  factory _$UpdateProfileRequestDtoCopyWith(_UpdateProfileRequestDto value,
          $Res Function(_UpdateProfileRequestDto) _then) =
      __$UpdateProfileRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$UpdateProfileRequestDtoCopyWithImpl<$Res>
    implements _$UpdateProfileRequestDtoCopyWith<$Res> {
  __$UpdateProfileRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateProfileRequestDto _self;
  final $Res Function(_UpdateProfileRequestDto) _then;

  /// Create a copy of UpdateProfileRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_UpdateProfileRequestDto(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
