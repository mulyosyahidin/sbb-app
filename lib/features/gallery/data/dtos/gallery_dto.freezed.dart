// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleryDto {
  int get id;
  String get tag;
  String get title;
  String? get content;
  String? get featuredImageUrl;
  List<GalleryItemDto>? get items;
  List<GalleryMetaDto>? get metas;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of GalleryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GalleryDtoCopyWith<GalleryDto> get copyWith =>
      _$GalleryDtoCopyWithImpl<GalleryDto>(this as GalleryDto, _$identity);

  /// Serializes this GalleryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GalleryDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.featuredImageUrl, featuredImageUrl) ||
                other.featuredImageUrl == featuredImageUrl) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.metas, metas) &&
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
      tag,
      title,
      content,
      featuredImageUrl,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(metas),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'GalleryDto(id: $id, tag: $tag, title: $title, content: $content, featuredImageUrl: $featuredImageUrl, items: $items, metas: $metas, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $GalleryDtoCopyWith<$Res> {
  factory $GalleryDtoCopyWith(
          GalleryDto value, $Res Function(GalleryDto) _then) =
      _$GalleryDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String tag,
      String title,
      String? content,
      String? featuredImageUrl,
      List<GalleryItemDto>? items,
      List<GalleryMetaDto>? metas,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$GalleryDtoCopyWithImpl<$Res> implements $GalleryDtoCopyWith<$Res> {
  _$GalleryDtoCopyWithImpl(this._self, this._then);

  final GalleryDto _self;
  final $Res Function(GalleryDto) _then;

  /// Create a copy of GalleryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? title = null,
    Object? content = freezed,
    Object? featuredImageUrl = freezed,
    Object? items = freezed,
    Object? metas = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      featuredImageUrl: freezed == featuredImageUrl
          ? _self.featuredImageUrl
          : featuredImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GalleryItemDto>?,
      metas: freezed == metas
          ? _self.metas
          : metas // ignore: cast_nullable_to_non_nullable
              as List<GalleryMetaDto>?,
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
class _GalleryDto implements GalleryDto {
  const _GalleryDto(
      {required this.id,
      required this.tag,
      required this.title,
      this.content,
      this.featuredImageUrl,
      final List<GalleryItemDto>? items,
      final List<GalleryMetaDto>? metas,
      required this.createdAt,
      required this.updatedAt})
      : _items = items,
        _metas = metas;
  factory _GalleryDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryDtoFromJson(json);

  @override
  final int id;
  @override
  final String tag;
  @override
  final String title;
  @override
  final String? content;
  @override
  final String? featuredImageUrl;
  final List<GalleryItemDto>? _items;
  @override
  List<GalleryItemDto>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GalleryMetaDto>? _metas;
  @override
  List<GalleryMetaDto>? get metas {
    final value = _metas;
    if (value == null) return null;
    if (_metas is EqualUnmodifiableListView) return _metas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of GalleryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GalleryDtoCopyWith<_GalleryDto> get copyWith =>
      __$GalleryDtoCopyWithImpl<_GalleryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GalleryDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GalleryDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.featuredImageUrl, featuredImageUrl) ||
                other.featuredImageUrl == featuredImageUrl) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._metas, _metas) &&
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
      tag,
      title,
      content,
      featuredImageUrl,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_metas),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'GalleryDto(id: $id, tag: $tag, title: $title, content: $content, featuredImageUrl: $featuredImageUrl, items: $items, metas: $metas, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$GalleryDtoCopyWith<$Res>
    implements $GalleryDtoCopyWith<$Res> {
  factory _$GalleryDtoCopyWith(
          _GalleryDto value, $Res Function(_GalleryDto) _then) =
      __$GalleryDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String tag,
      String title,
      String? content,
      String? featuredImageUrl,
      List<GalleryItemDto>? items,
      List<GalleryMetaDto>? metas,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$GalleryDtoCopyWithImpl<$Res> implements _$GalleryDtoCopyWith<$Res> {
  __$GalleryDtoCopyWithImpl(this._self, this._then);

  final _GalleryDto _self;
  final $Res Function(_GalleryDto) _then;

  /// Create a copy of GalleryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? title = null,
    Object? content = freezed,
    Object? featuredImageUrl = freezed,
    Object? items = freezed,
    Object? metas = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_GalleryDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      featuredImageUrl: freezed == featuredImageUrl
          ? _self.featuredImageUrl
          : featuredImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GalleryItemDto>?,
      metas: freezed == metas
          ? _self._metas
          : metas // ignore: cast_nullable_to_non_nullable
              as List<GalleryMetaDto>?,
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
