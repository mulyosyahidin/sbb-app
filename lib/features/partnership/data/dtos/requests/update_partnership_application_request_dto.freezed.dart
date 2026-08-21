// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_partnership_application_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePartnershipApplicationRequestDto {
  String get name;
  String get nik;
  String get address;
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get identityCardFile;
  String? get note;

  /// Create a copy of UpdatePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePartnershipApplicationRequestDtoCopyWith<
          UpdatePartnershipApplicationRequestDto>
      get copyWith => _$UpdatePartnershipApplicationRequestDtoCopyWithImpl<
              UpdatePartnershipApplicationRequestDto>(
          this as UpdatePartnershipApplicationRequestDto, _$identity);

  /// Serializes this UpdatePartnershipApplicationRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePartnershipApplicationRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityCardFile, identityCardFile) ||
                other.identityCardFile == identityCardFile) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, nik, address, identityCardFile, note);

  @override
  String toString() {
    return 'UpdatePartnershipApplicationRequestDto(name: $name, nik: $nik, address: $address, identityCardFile: $identityCardFile, note: $note)';
  }
}

/// @nodoc
abstract mixin class $UpdatePartnershipApplicationRequestDtoCopyWith<$Res> {
  factory $UpdatePartnershipApplicationRequestDtoCopyWith(
          UpdatePartnershipApplicationRequestDto value,
          $Res Function(UpdatePartnershipApplicationRequestDto) _then) =
      _$UpdatePartnershipApplicationRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String nik,
      String address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? identityCardFile,
      String? note});
}

/// @nodoc
class _$UpdatePartnershipApplicationRequestDtoCopyWithImpl<$Res>
    implements $UpdatePartnershipApplicationRequestDtoCopyWith<$Res> {
  _$UpdatePartnershipApplicationRequestDtoCopyWithImpl(this._self, this._then);

  final UpdatePartnershipApplicationRequestDto _self;
  final $Res Function(UpdatePartnershipApplicationRequestDto) _then;

  /// Create a copy of UpdatePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? identityCardFile = freezed,
    Object? note = freezed,
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
      identityCardFile: freezed == identityCardFile
          ? _self.identityCardFile
          : identityCardFile // ignore: cast_nullable_to_non_nullable
              as File?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdatePartnershipApplicationRequestDto
    extends UpdatePartnershipApplicationRequestDto {
  const _UpdatePartnershipApplicationRequestDto(
      {required this.name,
      required this.nik,
      required this.address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.identityCardFile,
      this.note})
      : super._();
  factory _UpdatePartnershipApplicationRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePartnershipApplicationRequestDtoFromJson(json);

  @override
  final String name;
  @override
  final String nik;
  @override
  final String address;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? identityCardFile;
  @override
  final String? note;

  /// Create a copy of UpdatePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdatePartnershipApplicationRequestDtoCopyWith<
          _UpdatePartnershipApplicationRequestDto>
      get copyWith => __$UpdatePartnershipApplicationRequestDtoCopyWithImpl<
          _UpdatePartnershipApplicationRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdatePartnershipApplicationRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePartnershipApplicationRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityCardFile, identityCardFile) ||
                other.identityCardFile == identityCardFile) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, nik, address, identityCardFile, note);

  @override
  String toString() {
    return 'UpdatePartnershipApplicationRequestDto(name: $name, nik: $nik, address: $address, identityCardFile: $identityCardFile, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$UpdatePartnershipApplicationRequestDtoCopyWith<$Res>
    implements $UpdatePartnershipApplicationRequestDtoCopyWith<$Res> {
  factory _$UpdatePartnershipApplicationRequestDtoCopyWith(
          _UpdatePartnershipApplicationRequestDto value,
          $Res Function(_UpdatePartnershipApplicationRequestDto) _then) =
      __$UpdatePartnershipApplicationRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String nik,
      String address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? identityCardFile,
      String? note});
}

/// @nodoc
class __$UpdatePartnershipApplicationRequestDtoCopyWithImpl<$Res>
    implements _$UpdatePartnershipApplicationRequestDtoCopyWith<$Res> {
  __$UpdatePartnershipApplicationRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdatePartnershipApplicationRequestDto _self;
  final $Res Function(_UpdatePartnershipApplicationRequestDto) _then;

  /// Create a copy of UpdatePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? identityCardFile = freezed,
    Object? note = freezed,
  }) {
    return _then(_UpdatePartnershipApplicationRequestDto(
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
      identityCardFile: freezed == identityCardFile
          ? _self.identityCardFile
          : identityCardFile // ignore: cast_nullable_to_non_nullable
              as File?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
