// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activity_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserActivityDto {
  int get id;
  String get iconName;
  String get color;
  String get title;
  String get description;
  String? get highlightedText;
  Map<String, dynamic>? get data;
  DateTime get createdAt;

  /// Create a copy of UserActivityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserActivityDtoCopyWith<UserActivityDto> get copyWith =>
      _$UserActivityDtoCopyWithImpl<UserActivityDto>(
          this as UserActivityDto, _$identity);

  /// Serializes this UserActivityDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserActivityDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.highlightedText, highlightedText) ||
                other.highlightedText == highlightedText) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      iconName,
      color,
      title,
      description,
      highlightedText,
      const DeepCollectionEquality().hash(data),
      createdAt);

  @override
  String toString() {
    return 'UserActivityDto(id: $id, iconName: $iconName, color: $color, title: $title, description: $description, highlightedText: $highlightedText, data: $data, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserActivityDtoCopyWith<$Res> {
  factory $UserActivityDtoCopyWith(
          UserActivityDto value, $Res Function(UserActivityDto) _then) =
      _$UserActivityDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String iconName,
      String color,
      String title,
      String description,
      String? highlightedText,
      Map<String, dynamic>? data,
      DateTime createdAt});
}

/// @nodoc
class _$UserActivityDtoCopyWithImpl<$Res>
    implements $UserActivityDtoCopyWith<$Res> {
  _$UserActivityDtoCopyWithImpl(this._self, this._then);

  final UserActivityDto _self;
  final $Res Function(UserActivityDto) _then;

  /// Create a copy of UserActivityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iconName = null,
    Object? color = null,
    Object? title = null,
    Object? description = null,
    Object? highlightedText = freezed,
    Object? data = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iconName: null == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      highlightedText: freezed == highlightedText
          ? _self.highlightedText
          : highlightedText // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserActivityDto implements UserActivityDto {
  const _UserActivityDto(
      {required this.id,
      required this.iconName,
      required this.color,
      required this.title,
      required this.description,
      this.highlightedText,
      final Map<String, dynamic>? data,
      required this.createdAt})
      : _data = data;
  factory _UserActivityDto.fromJson(Map<String, dynamic> json) =>
      _$UserActivityDtoFromJson(json);

  @override
  final int id;
  @override
  final String iconName;
  @override
  final String color;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? highlightedText;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of UserActivityDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserActivityDtoCopyWith<_UserActivityDto> get copyWith =>
      __$UserActivityDtoCopyWithImpl<_UserActivityDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserActivityDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserActivityDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.highlightedText, highlightedText) ||
                other.highlightedText == highlightedText) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      iconName,
      color,
      title,
      description,
      highlightedText,
      const DeepCollectionEquality().hash(_data),
      createdAt);

  @override
  String toString() {
    return 'UserActivityDto(id: $id, iconName: $iconName, color: $color, title: $title, description: $description, highlightedText: $highlightedText, data: $data, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserActivityDtoCopyWith<$Res>
    implements $UserActivityDtoCopyWith<$Res> {
  factory _$UserActivityDtoCopyWith(
          _UserActivityDto value, $Res Function(_UserActivityDto) _then) =
      __$UserActivityDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String iconName,
      String color,
      String title,
      String description,
      String? highlightedText,
      Map<String, dynamic>? data,
      DateTime createdAt});
}

/// @nodoc
class __$UserActivityDtoCopyWithImpl<$Res>
    implements _$UserActivityDtoCopyWith<$Res> {
  __$UserActivityDtoCopyWithImpl(this._self, this._then);

  final _UserActivityDto _self;
  final $Res Function(_UserActivityDto) _then;

  /// Create a copy of UserActivityDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? iconName = null,
    Object? color = null,
    Object? title = null,
    Object? description = null,
    Object? highlightedText = freezed,
    Object? data = freezed,
    Object? createdAt = null,
  }) {
    return _then(_UserActivityDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      iconName: null == iconName
          ? _self.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      highlightedText: freezed == highlightedText
          ? _self.highlightedText
          : highlightedText // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
