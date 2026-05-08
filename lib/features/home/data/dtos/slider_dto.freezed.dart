// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SliderDto {
  int get id;
  String get tag;
  String get title;
  String get subTitle;
  String get imageUrl;
  String? get url;
  int get sequence;

  /// Create a copy of SliderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SliderDtoCopyWith<SliderDto> get copyWith =>
      _$SliderDtoCopyWithImpl<SliderDto>(this as SliderDto, _$identity);

  /// Serializes this SliderDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SliderDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tag, title, subTitle, imageUrl, url, sequence);

  @override
  String toString() {
    return 'SliderDto(id: $id, tag: $tag, title: $title, subTitle: $subTitle, imageUrl: $imageUrl, url: $url, sequence: $sequence)';
  }
}

/// @nodoc
abstract mixin class $SliderDtoCopyWith<$Res> {
  factory $SliderDtoCopyWith(SliderDto value, $Res Function(SliderDto) _then) =
      _$SliderDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String tag,
      String title,
      String subTitle,
      String imageUrl,
      String? url,
      int sequence});
}

/// @nodoc
class _$SliderDtoCopyWithImpl<$Res> implements $SliderDtoCopyWith<$Res> {
  _$SliderDtoCopyWithImpl(this._self, this._then);

  final SliderDto _self;
  final $Res Function(SliderDto) _then;

  /// Create a copy of SliderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? title = null,
    Object? subTitle = null,
    Object? imageUrl = null,
    Object? url = freezed,
    Object? sequence = null,
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
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: null == sequence
          ? _self.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SliderDto implements SliderDto {
  const _SliderDto(
      {required this.id,
      required this.tag,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      this.url,
      required this.sequence});
  factory _SliderDto.fromJson(Map<String, dynamic> json) =>
      _$SliderDtoFromJson(json);

  @override
  final int id;
  @override
  final String tag;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String imageUrl;
  @override
  final String? url;
  @override
  final int sequence;

  /// Create a copy of SliderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SliderDtoCopyWith<_SliderDto> get copyWith =>
      __$SliderDtoCopyWithImpl<_SliderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SliderDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SliderDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tag, title, subTitle, imageUrl, url, sequence);

  @override
  String toString() {
    return 'SliderDto(id: $id, tag: $tag, title: $title, subTitle: $subTitle, imageUrl: $imageUrl, url: $url, sequence: $sequence)';
  }
}

/// @nodoc
abstract mixin class _$SliderDtoCopyWith<$Res>
    implements $SliderDtoCopyWith<$Res> {
  factory _$SliderDtoCopyWith(
          _SliderDto value, $Res Function(_SliderDto) _then) =
      __$SliderDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String tag,
      String title,
      String subTitle,
      String imageUrl,
      String? url,
      int sequence});
}

/// @nodoc
class __$SliderDtoCopyWithImpl<$Res> implements _$SliderDtoCopyWith<$Res> {
  __$SliderDtoCopyWithImpl(this._self, this._then);

  final _SliderDto _self;
  final $Res Function(_SliderDto) _then;

  /// Create a copy of SliderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? tag = null,
    Object? title = null,
    Object? subTitle = null,
    Object? imageUrl = null,
    Object? url = freezed,
    Object? sequence = null,
  }) {
    return _then(_SliderDto(
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
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: null == sequence
          ? _self.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
