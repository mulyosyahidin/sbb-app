// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cow_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CowImageDto {
  int get id;
  String get url;

  /// Create a copy of CowImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CowImageDtoCopyWith<CowImageDto> get copyWith =>
      _$CowImageDtoCopyWithImpl<CowImageDto>(this as CowImageDto, _$identity);

  /// Serializes this CowImageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CowImageDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @override
  String toString() {
    return 'CowImageDto(id: $id, url: $url)';
  }
}

/// @nodoc
abstract mixin class $CowImageDtoCopyWith<$Res> {
  factory $CowImageDtoCopyWith(
          CowImageDto value, $Res Function(CowImageDto) _then) =
      _$CowImageDtoCopyWithImpl;
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class _$CowImageDtoCopyWithImpl<$Res> implements $CowImageDtoCopyWith<$Res> {
  _$CowImageDtoCopyWithImpl(this._self, this._then);

  final CowImageDto _self;
  final $Res Function(CowImageDto) _then;

  /// Create a copy of CowImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CowImageDto implements CowImageDto {
  const _CowImageDto({required this.id, required this.url});
  factory _CowImageDto.fromJson(Map<String, dynamic> json) =>
      _$CowImageDtoFromJson(json);

  @override
  final int id;
  @override
  final String url;

  /// Create a copy of CowImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CowImageDtoCopyWith<_CowImageDto> get copyWith =>
      __$CowImageDtoCopyWithImpl<_CowImageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CowImageDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CowImageDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @override
  String toString() {
    return 'CowImageDto(id: $id, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$CowImageDtoCopyWith<$Res>
    implements $CowImageDtoCopyWith<$Res> {
  factory _$CowImageDtoCopyWith(
          _CowImageDto value, $Res Function(_CowImageDto) _then) =
      __$CowImageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class __$CowImageDtoCopyWithImpl<$Res> implements _$CowImageDtoCopyWith<$Res> {
  __$CowImageDtoCopyWithImpl(this._self, this._then);

  final _CowImageDto _self;
  final $Res Function(_CowImageDto) _then;

  /// Create a copy of CowImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_CowImageDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
