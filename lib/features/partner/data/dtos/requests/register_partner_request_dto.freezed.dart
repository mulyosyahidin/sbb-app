// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_partner_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterPartnerRequestDto {
  String get name;
  String get nik;
  String get address;
  String get joinDate;
  String get level;

  /// Create a copy of RegisterPartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterPartnerRequestDtoCopyWith<RegisterPartnerRequestDto> get copyWith =>
      _$RegisterPartnerRequestDtoCopyWithImpl<RegisterPartnerRequestDto>(
          this as RegisterPartnerRequestDto, _$identity);

  /// Serializes this RegisterPartnerRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterPartnerRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, nik, address, joinDate, level);

  @override
  String toString() {
    return 'RegisterPartnerRequestDto(name: $name, nik: $nik, address: $address, joinDate: $joinDate, level: $level)';
  }
}

/// @nodoc
abstract mixin class $RegisterPartnerRequestDtoCopyWith<$Res> {
  factory $RegisterPartnerRequestDtoCopyWith(RegisterPartnerRequestDto value,
          $Res Function(RegisterPartnerRequestDto) _then) =
      _$RegisterPartnerRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String name, String nik, String address, String joinDate, String level});
}

/// @nodoc
class _$RegisterPartnerRequestDtoCopyWithImpl<$Res>
    implements $RegisterPartnerRequestDtoCopyWith<$Res> {
  _$RegisterPartnerRequestDtoCopyWithImpl(this._self, this._then);

  final RegisterPartnerRequestDto _self;
  final $Res Function(RegisterPartnerRequestDto) _then;

  /// Create a copy of RegisterPartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? joinDate = null,
    Object? level = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nik: null == nik
          ? _self.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      joinDate: null == joinDate
          ? _self.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RegisterPartnerRequestDto implements RegisterPartnerRequestDto {
  const _RegisterPartnerRequestDto(
      {required this.name,
      required this.nik,
      required this.address,
      required this.joinDate,
      required this.level});
  factory _RegisterPartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPartnerRequestDtoFromJson(json);

  @override
  final String name;
  @override
  final String nik;
  @override
  final String address;
  @override
  final String joinDate;
  @override
  final String level;

  /// Create a copy of RegisterPartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterPartnerRequestDtoCopyWith<_RegisterPartnerRequestDto>
      get copyWith =>
          __$RegisterPartnerRequestDtoCopyWithImpl<_RegisterPartnerRequestDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterPartnerRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterPartnerRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, nik, address, joinDate, level);

  @override
  String toString() {
    return 'RegisterPartnerRequestDto(name: $name, nik: $nik, address: $address, joinDate: $joinDate, level: $level)';
  }
}

/// @nodoc
abstract mixin class _$RegisterPartnerRequestDtoCopyWith<$Res>
    implements $RegisterPartnerRequestDtoCopyWith<$Res> {
  factory _$RegisterPartnerRequestDtoCopyWith(_RegisterPartnerRequestDto value,
          $Res Function(_RegisterPartnerRequestDto) _then) =
      __$RegisterPartnerRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String nik, String address, String joinDate, String level});
}

/// @nodoc
class __$RegisterPartnerRequestDtoCopyWithImpl<$Res>
    implements _$RegisterPartnerRequestDtoCopyWith<$Res> {
  __$RegisterPartnerRequestDtoCopyWithImpl(this._self, this._then);

  final _RegisterPartnerRequestDto _self;
  final $Res Function(_RegisterPartnerRequestDto) _then;

  /// Create a copy of RegisterPartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? joinDate = null,
    Object? level = null,
  }) {
    return _then(_RegisterPartnerRequestDto(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nik: null == nik
          ? _self.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      joinDate: null == joinDate
          ? _self.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
