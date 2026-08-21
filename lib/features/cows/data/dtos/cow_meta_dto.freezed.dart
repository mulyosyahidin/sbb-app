// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cow_meta_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CowMetaDto {
  String get key;
  String get value;

  /// Create a copy of CowMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CowMetaDtoCopyWith<CowMetaDto> get copyWith =>
      _$CowMetaDtoCopyWithImpl<CowMetaDto>(this as CowMetaDto, _$identity);

  /// Serializes this CowMetaDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CowMetaDto &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @override
  String toString() {
    return 'CowMetaDto(key: $key, value: $value)';
  }
}

/// @nodoc
abstract mixin class $CowMetaDtoCopyWith<$Res> {
  factory $CowMetaDtoCopyWith(
          CowMetaDto value, $Res Function(CowMetaDto) _then) =
      _$CowMetaDtoCopyWithImpl;
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class _$CowMetaDtoCopyWithImpl<$Res> implements $CowMetaDtoCopyWith<$Res> {
  _$CowMetaDtoCopyWithImpl(this._self, this._then);

  final CowMetaDto _self;
  final $Res Function(CowMetaDto) _then;

  /// Create a copy of CowMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CowMetaDto implements CowMetaDto {
  const _CowMetaDto({required this.key, required this.value});
  factory _CowMetaDto.fromJson(Map<String, dynamic> json) =>
      _$CowMetaDtoFromJson(json);

  @override
  final String key;
  @override
  final String value;

  /// Create a copy of CowMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CowMetaDtoCopyWith<_CowMetaDto> get copyWith =>
      __$CowMetaDtoCopyWithImpl<_CowMetaDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CowMetaDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CowMetaDto &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @override
  String toString() {
    return 'CowMetaDto(key: $key, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$CowMetaDtoCopyWith<$Res>
    implements $CowMetaDtoCopyWith<$Res> {
  factory _$CowMetaDtoCopyWith(
          _CowMetaDto value, $Res Function(_CowMetaDto) _then) =
      __$CowMetaDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class __$CowMetaDtoCopyWithImpl<$Res> implements _$CowMetaDtoCopyWith<$Res> {
  __$CowMetaDtoCopyWithImpl(this._self, this._then);

  final _CowMetaDto _self;
  final $Res Function(_CowMetaDto) _then;

  /// Create a copy of CowMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_CowMetaDto(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
