// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_meta_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleryMetaDto {
  int get id;
  String get metaIcon;
  String get metaTitle;
  String get metaContent;

  /// Create a copy of GalleryMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GalleryMetaDtoCopyWith<GalleryMetaDto> get copyWith =>
      _$GalleryMetaDtoCopyWithImpl<GalleryMetaDto>(
          this as GalleryMetaDto, _$identity);

  /// Serializes this GalleryMetaDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GalleryMetaDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.metaIcon, metaIcon) ||
                other.metaIcon == metaIcon) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaContent, metaContent) ||
                other.metaContent == metaContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, metaIcon, metaTitle, metaContent);

  @override
  String toString() {
    return 'GalleryMetaDto(id: $id, metaIcon: $metaIcon, metaTitle: $metaTitle, metaContent: $metaContent)';
  }
}

/// @nodoc
abstract mixin class $GalleryMetaDtoCopyWith<$Res> {
  factory $GalleryMetaDtoCopyWith(
          GalleryMetaDto value, $Res Function(GalleryMetaDto) _then) =
      _$GalleryMetaDtoCopyWithImpl;
  @useResult
  $Res call({int id, String metaIcon, String metaTitle, String metaContent});
}

/// @nodoc
class _$GalleryMetaDtoCopyWithImpl<$Res>
    implements $GalleryMetaDtoCopyWith<$Res> {
  _$GalleryMetaDtoCopyWithImpl(this._self, this._then);

  final GalleryMetaDto _self;
  final $Res Function(GalleryMetaDto) _then;

  /// Create a copy of GalleryMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? metaIcon = null,
    Object? metaTitle = null,
    Object? metaContent = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      metaIcon: null == metaIcon
          ? _self.metaIcon
          : metaIcon // ignore: cast_nullable_to_non_nullable
              as String,
      metaTitle: null == metaTitle
          ? _self.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String,
      metaContent: null == metaContent
          ? _self.metaContent
          : metaContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GalleryMetaDto implements GalleryMetaDto {
  const _GalleryMetaDto(
      {required this.id,
      required this.metaIcon,
      required this.metaTitle,
      required this.metaContent});
  factory _GalleryMetaDto.fromJson(Map<String, dynamic> json) =>
      _$GalleryMetaDtoFromJson(json);

  @override
  final int id;
  @override
  final String metaIcon;
  @override
  final String metaTitle;
  @override
  final String metaContent;

  /// Create a copy of GalleryMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GalleryMetaDtoCopyWith<_GalleryMetaDto> get copyWith =>
      __$GalleryMetaDtoCopyWithImpl<_GalleryMetaDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GalleryMetaDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GalleryMetaDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.metaIcon, metaIcon) ||
                other.metaIcon == metaIcon) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaContent, metaContent) ||
                other.metaContent == metaContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, metaIcon, metaTitle, metaContent);

  @override
  String toString() {
    return 'GalleryMetaDto(id: $id, metaIcon: $metaIcon, metaTitle: $metaTitle, metaContent: $metaContent)';
  }
}

/// @nodoc
abstract mixin class _$GalleryMetaDtoCopyWith<$Res>
    implements $GalleryMetaDtoCopyWith<$Res> {
  factory _$GalleryMetaDtoCopyWith(
          _GalleryMetaDto value, $Res Function(_GalleryMetaDto) _then) =
      __$GalleryMetaDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String metaIcon, String metaTitle, String metaContent});
}

/// @nodoc
class __$GalleryMetaDtoCopyWithImpl<$Res>
    implements _$GalleryMetaDtoCopyWith<$Res> {
  __$GalleryMetaDtoCopyWithImpl(this._self, this._then);

  final _GalleryMetaDto _self;
  final $Res Function(_GalleryMetaDto) _then;

  /// Create a copy of GalleryMetaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? metaIcon = null,
    Object? metaTitle = null,
    Object? metaContent = null,
  }) {
    return _then(_GalleryMetaDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      metaIcon: null == metaIcon
          ? _self.metaIcon
          : metaIcon // ignore: cast_nullable_to_non_nullable
              as String,
      metaTitle: null == metaTitle
          ? _self.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String,
      metaContent: null == metaContent
          ? _self.metaContent
          : metaContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
