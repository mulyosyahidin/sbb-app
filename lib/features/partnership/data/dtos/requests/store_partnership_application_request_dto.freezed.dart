// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_partnership_application_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorePartnershipApplicationRequestDto {
  int get level;
  String get name;
  String get nik;
  String get address;
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get identityCardFile;
  String? get note;

  /// Create a copy of StorePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StorePartnershipApplicationRequestDtoCopyWith<
          StorePartnershipApplicationRequestDto>
      get copyWith => _$StorePartnershipApplicationRequestDtoCopyWithImpl<
              StorePartnershipApplicationRequestDto>(
          this as StorePartnershipApplicationRequestDto, _$identity);

  /// Serializes this StorePartnershipApplicationRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StorePartnershipApplicationRequestDto &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityCardFile, identityCardFile) ||
                other.identityCardFile == identityCardFile) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, level, name, nik, address, identityCardFile, note);

  @override
  String toString() {
    return 'StorePartnershipApplicationRequestDto(level: $level, name: $name, nik: $nik, address: $address, identityCardFile: $identityCardFile, note: $note)';
  }
}

/// @nodoc
abstract mixin class $StorePartnershipApplicationRequestDtoCopyWith<$Res> {
  factory $StorePartnershipApplicationRequestDtoCopyWith(
          StorePartnershipApplicationRequestDto value,
          $Res Function(StorePartnershipApplicationRequestDto) _then) =
      _$StorePartnershipApplicationRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {int level,
      String name,
      String nik,
      String address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? identityCardFile,
      String? note});
}

/// @nodoc
class _$StorePartnershipApplicationRequestDtoCopyWithImpl<$Res>
    implements $StorePartnershipApplicationRequestDtoCopyWith<$Res> {
  _$StorePartnershipApplicationRequestDtoCopyWithImpl(this._self, this._then);

  final StorePartnershipApplicationRequestDto _self;
  final $Res Function(StorePartnershipApplicationRequestDto) _then;

  /// Create a copy of StorePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? identityCardFile = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
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
class _StorePartnershipApplicationRequestDto
    extends StorePartnershipApplicationRequestDto {
  const _StorePartnershipApplicationRequestDto(
      {required this.level,
      required this.name,
      required this.nik,
      required this.address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.identityCardFile,
      this.note})
      : super._();
  factory _StorePartnershipApplicationRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$StorePartnershipApplicationRequestDtoFromJson(json);

  @override
  final int level;
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

  /// Create a copy of StorePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StorePartnershipApplicationRequestDtoCopyWith<
          _StorePartnershipApplicationRequestDto>
      get copyWith => __$StorePartnershipApplicationRequestDtoCopyWithImpl<
          _StorePartnershipApplicationRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StorePartnershipApplicationRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StorePartnershipApplicationRequestDto &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityCardFile, identityCardFile) ||
                other.identityCardFile == identityCardFile) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, level, name, nik, address, identityCardFile, note);

  @override
  String toString() {
    return 'StorePartnershipApplicationRequestDto(level: $level, name: $name, nik: $nik, address: $address, identityCardFile: $identityCardFile, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$StorePartnershipApplicationRequestDtoCopyWith<$Res>
    implements $StorePartnershipApplicationRequestDtoCopyWith<$Res> {
  factory _$StorePartnershipApplicationRequestDtoCopyWith(
          _StorePartnershipApplicationRequestDto value,
          $Res Function(_StorePartnershipApplicationRequestDto) _then) =
      __$StorePartnershipApplicationRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int level,
      String name,
      String nik,
      String address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? identityCardFile,
      String? note});
}

/// @nodoc
class __$StorePartnershipApplicationRequestDtoCopyWithImpl<$Res>
    implements _$StorePartnershipApplicationRequestDtoCopyWith<$Res> {
  __$StorePartnershipApplicationRequestDtoCopyWithImpl(this._self, this._then);

  final _StorePartnershipApplicationRequestDto _self;
  final $Res Function(_StorePartnershipApplicationRequestDto) _then;

  /// Create a copy of StorePartnershipApplicationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? level = null,
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? identityCardFile = freezed,
    Object? note = freezed,
  }) {
    return _then(_StorePartnershipApplicationRequestDto(
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
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
