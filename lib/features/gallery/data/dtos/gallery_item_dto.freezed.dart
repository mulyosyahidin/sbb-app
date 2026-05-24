// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleryItemDto {
  int get id;
  String? get caption;
  String? get imageUrl;
  String? get featuredImageUrl;

  /// Create a copy of GalleryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GalleryItemDtoCopyWith<GalleryItemDto> get copyWith =>
      _$GalleryItemDtoCopyWithImpl<GalleryItemDto>(
          this as GalleryItemDto, _$identity);

  /// Serializes this GalleryItemDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GalleryItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.featuredImageUrl, featuredImageUrl) ||
                other.featuredImageUrl == featuredImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, caption, imageUrl, featuredImageUrl);

  @override
  String toString() {
    return 'GalleryItemDto(id: $id, caption: $caption, imageUrl: $imageUrl, featuredImageUrl: $featuredImageUrl)';
  }
}

/// @nodoc
abstract mixin class $GalleryItemDtoCopyWith<$Res> {
  factory $GalleryItemDtoCopyWith(
          GalleryItemDto value, $Res Function(GalleryItemDto) _then) =
      _$GalleryItemDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id, String? caption, String? imageUrl, String? featuredImageUrl});
}

/// @nodoc
class _$GalleryItemDtoCopyWithImpl<$Res>
    implements $GalleryItemDtoCopyWith<$Res> {
  _$GalleryItemDtoCopyWithImpl(this._self, this._then);

  final GalleryItemDto _self;
  final $Res Function(GalleryItemDto) _then;

  /// Create a copy of GalleryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = freezed,
    Object? imageUrl = freezed,
    Object? featuredImageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      featuredImageUrl: freezed == featuredImageUrl
          ? _self.featuredImageUrl
          : featuredImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GalleryItemDto implements GalleryItemDto {
  const _GalleryItemDto(
      {required this.id, this.caption, this.imageUrl, this.featuredImageUrl});
  factory _GalleryItemDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryItemDtoFromJson(json);

  @override
  final int id;
  @override
  final String? caption;
  @override
  final String? imageUrl;
  @override
  final String? featuredImageUrl;

  /// Create a copy of GalleryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GalleryItemDtoCopyWith<_GalleryItemDto> get copyWith =>
      __$GalleryItemDtoCopyWithImpl<_GalleryItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GalleryItemDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GalleryItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.featuredImageUrl, featuredImageUrl) ||
                other.featuredImageUrl == featuredImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, caption, imageUrl, featuredImageUrl);

  @override
  String toString() {
    return 'GalleryItemDto(id: $id, caption: $caption, imageUrl: $imageUrl, featuredImageUrl: $featuredImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$GalleryItemDtoCopyWith<$Res>
    implements $GalleryItemDtoCopyWith<$Res> {
  factory _$GalleryItemDtoCopyWith(
          _GalleryItemDto value, $Res Function(_GalleryItemDto) _then) =
      __$GalleryItemDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String? caption, String? imageUrl, String? featuredImageUrl});
}

/// @nodoc
class __$GalleryItemDtoCopyWithImpl<$Res>
    implements _$GalleryItemDtoCopyWith<$Res> {
  __$GalleryItemDtoCopyWithImpl(this._self, this._then);

  final _GalleryItemDto _self;
  final $Res Function(_GalleryItemDto) _then;

  /// Create a copy of GalleryItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? caption = freezed,
    Object? imageUrl = freezed,
    Object? featuredImageUrl = freezed,
  }) {
    return _then(_GalleryItemDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      featuredImageUrl: freezed == featuredImageUrl
          ? _self.featuredImageUrl
          : featuredImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
