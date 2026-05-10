// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cow_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CowDto {
  int get id;
  String get name;
  String? get description;
  @DoubleStringConverter()
  double? get weightKg;
  bool get isAvailable;
  String get currentPrice;
  String get featuredImageUrl;
  List<CowMetaDto>? get metas;
  List<CowImageDto>? get images;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of CowDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CowDtoCopyWith<CowDto> get copyWith =>
      _$CowDtoCopyWithImpl<CowDto>(this as CowDto, _$identity);

  /// Serializes this CowDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CowDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.featuredImageUrl, featuredImageUrl) ||
                other.featuredImageUrl == featuredImageUrl) &&
            const DeepCollectionEquality().equals(other.metas, metas) &&
            const DeepCollectionEquality().equals(other.images, images) &&
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
      name,
      description,
      weightKg,
      isAvailable,
      currentPrice,
      featuredImageUrl,
      const DeepCollectionEquality().hash(metas),
      const DeepCollectionEquality().hash(images),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'CowDto(id: $id, name: $name, description: $description, weightKg: $weightKg, isAvailable: $isAvailable, currentPrice: $currentPrice, featuredImageUrl: $featuredImageUrl, metas: $metas, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CowDtoCopyWith<$Res> {
  factory $CowDtoCopyWith(CowDto value, $Res Function(CowDto) _then) =
      _$CowDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @DoubleStringConverter() double? weightKg,
      bool isAvailable,
      String currentPrice,
      String featuredImageUrl,
      List<CowMetaDto>? metas,
      List<CowImageDto>? images,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CowDtoCopyWithImpl<$Res> implements $CowDtoCopyWith<$Res> {
  _$CowDtoCopyWithImpl(this._self, this._then);

  final CowDto _self;
  final $Res Function(CowDto) _then;

  /// Create a copy of CowDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? weightKg = freezed,
    Object? isAvailable = null,
    Object? currentPrice = null,
    Object? featuredImageUrl = null,
    Object? metas = freezed,
    Object? images = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPrice: null == currentPrice
          ? _self.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImageUrl: null == featuredImageUrl
          ? _self.featuredImageUrl
          : featuredImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      metas: freezed == metas
          ? _self.metas
          : metas // ignore: cast_nullable_to_non_nullable
              as List<CowMetaDto>?,
      images: freezed == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<CowImageDto>?,
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
class _CowDto implements CowDto {
  const _CowDto(
      {required this.id,
      required this.name,
      this.description,
      @DoubleStringConverter() required this.weightKg,
      required this.isAvailable,
      required this.currentPrice,
      required this.featuredImageUrl,
      final List<CowMetaDto>? metas,
      final List<CowImageDto>? images,
      required this.createdAt,
      required this.updatedAt})
      : _metas = metas,
        _images = images;
  factory _CowDto.fromJson(Map<String, dynamic> json) => _$CowDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @DoubleStringConverter()
  final double? weightKg;
  @override
  final bool isAvailable;
  @override
  final String currentPrice;
  @override
  final String featuredImageUrl;
  final List<CowMetaDto>? _metas;
  @override
  List<CowMetaDto>? get metas {
    final value = _metas;
    if (value == null) return null;
    if (_metas is EqualUnmodifiableListView) return _metas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CowImageDto>? _images;
  @override
  List<CowImageDto>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of CowDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CowDtoCopyWith<_CowDto> get copyWith =>
      __$CowDtoCopyWithImpl<_CowDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CowDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CowDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.featuredImageUrl, featuredImageUrl) ||
                other.featuredImageUrl == featuredImageUrl) &&
            const DeepCollectionEquality().equals(other._metas, _metas) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
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
      name,
      description,
      weightKg,
      isAvailable,
      currentPrice,
      featuredImageUrl,
      const DeepCollectionEquality().hash(_metas),
      const DeepCollectionEquality().hash(_images),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'CowDto(id: $id, name: $name, description: $description, weightKg: $weightKg, isAvailable: $isAvailable, currentPrice: $currentPrice, featuredImageUrl: $featuredImageUrl, metas: $metas, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CowDtoCopyWith<$Res> implements $CowDtoCopyWith<$Res> {
  factory _$CowDtoCopyWith(_CowDto value, $Res Function(_CowDto) _then) =
      __$CowDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @DoubleStringConverter() double? weightKg,
      bool isAvailable,
      String currentPrice,
      String featuredImageUrl,
      List<CowMetaDto>? metas,
      List<CowImageDto>? images,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$CowDtoCopyWithImpl<$Res> implements _$CowDtoCopyWith<$Res> {
  __$CowDtoCopyWithImpl(this._self, this._then);

  final _CowDto _self;
  final $Res Function(_CowDto) _then;

  /// Create a copy of CowDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? weightKg = freezed,
    Object? isAvailable = null,
    Object? currentPrice = null,
    Object? featuredImageUrl = null,
    Object? metas = freezed,
    Object? images = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_CowDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weightKg: freezed == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPrice: null == currentPrice
          ? _self.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImageUrl: null == featuredImageUrl
          ? _self.featuredImageUrl
          : featuredImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      metas: freezed == metas
          ? _self._metas
          : metas // ignore: cast_nullable_to_non_nullable
              as List<CowMetaDto>?,
      images: freezed == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<CowImageDto>?,
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
