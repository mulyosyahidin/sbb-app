// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_partner_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePartnerRequestDto {
  String get name;
  String get nik;
  String get address;
  String get phoneNumber;
  String get joinDate;

  /// Create a copy of UpdatePartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePartnerRequestDtoCopyWith<UpdatePartnerRequestDto> get copyWith =>
      _$UpdatePartnerRequestDtoCopyWithImpl<UpdatePartnerRequestDto>(
          this as UpdatePartnerRequestDto, _$identity);

  /// Serializes this UpdatePartnerRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePartnerRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, nik, address, phoneNumber, joinDate);

  @override
  String toString() {
    return 'UpdatePartnerRequestDto(name: $name, nik: $nik, address: $address, phoneNumber: $phoneNumber, joinDate: $joinDate)';
  }
}

/// @nodoc
abstract mixin class $UpdatePartnerRequestDtoCopyWith<$Res> {
  factory $UpdatePartnerRequestDtoCopyWith(UpdatePartnerRequestDto value,
          $Res Function(UpdatePartnerRequestDto) _then) =
      _$UpdatePartnerRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String nik,
      String address,
      String phoneNumber,
      String joinDate});
}

/// @nodoc
class _$UpdatePartnerRequestDtoCopyWithImpl<$Res>
    implements $UpdatePartnerRequestDtoCopyWith<$Res> {
  _$UpdatePartnerRequestDtoCopyWithImpl(this._self, this._then);

  final UpdatePartnerRequestDto _self;
  final $Res Function(UpdatePartnerRequestDto) _then;

  /// Create a copy of UpdatePartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? joinDate = null,
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
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      joinDate: null == joinDate
          ? _self.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdatePartnerRequestDto implements UpdatePartnerRequestDto {
  const _UpdatePartnerRequestDto(
      {required this.name,
      required this.nik,
      required this.address,
      required this.phoneNumber,
      required this.joinDate});
  factory _UpdatePartnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartnerRequestDtoFromJson(json);

  @override
  final String name;
  @override
  final String nik;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final String joinDate;

  /// Create a copy of UpdatePartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatePartnerRequestDtoCopyWith<_UpdatePartnerRequestDto> get copyWith =>
      __$UpdatePartnerRequestDtoCopyWithImpl<_UpdatePartnerRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdatePartnerRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePartnerRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, nik, address, phoneNumber, joinDate);

  @override
  String toString() {
    return 'UpdatePartnerRequestDto(name: $name, nik: $nik, address: $address, phoneNumber: $phoneNumber, joinDate: $joinDate)';
  }
}

/// @nodoc
abstract mixin class _$UpdatePartnerRequestDtoCopyWith<$Res>
    implements $UpdatePartnerRequestDtoCopyWith<$Res> {
  factory _$UpdatePartnerRequestDtoCopyWith(_UpdatePartnerRequestDto value,
          $Res Function(_UpdatePartnerRequestDto) _then) =
      __$UpdatePartnerRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String nik,
      String address,
      String phoneNumber,
      String joinDate});
}

/// @nodoc
class __$UpdatePartnerRequestDtoCopyWithImpl<$Res>
    implements _$UpdatePartnerRequestDtoCopyWith<$Res> {
  __$UpdatePartnerRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdatePartnerRequestDto _self;
  final $Res Function(_UpdatePartnerRequestDto) _then;

  /// Create a copy of UpdatePartnerRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? joinDate = null,
  }) {
    return _then(_UpdatePartnerRequestDto(
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
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      joinDate: null == joinDate
          ? _self.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
