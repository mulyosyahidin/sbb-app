// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_file_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFileDto {
  int get id;
  int? get userId;
  String get fileName;
  String get fileType;
  int get fileSize;
  String get fileUrl;

  /// Create a copy of AppFileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppFileDtoCopyWith<AppFileDto> get copyWith =>
      _$AppFileDtoCopyWithImpl<AppFileDto>(this as AppFileDto, _$identity);

  /// Serializes this AppFileDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppFileDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, fileName, fileType, fileSize, fileUrl);

  @override
  String toString() {
    return 'AppFileDto(id: $id, userId: $userId, fileName: $fileName, fileType: $fileType, fileSize: $fileSize, fileUrl: $fileUrl)';
  }
}

/// @nodoc
abstract mixin class $AppFileDtoCopyWith<$Res> {
  factory $AppFileDtoCopyWith(
          AppFileDto value, $Res Function(AppFileDto) _then) =
      _$AppFileDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int? userId,
      String fileName,
      String fileType,
      int fileSize,
      String fileUrl});
}

/// @nodoc
class _$AppFileDtoCopyWithImpl<$Res> implements $AppFileDtoCopyWith<$Res> {
  _$AppFileDtoCopyWithImpl(this._self, this._then);

  final AppFileDto _self;
  final $Res Function(AppFileDto) _then;

  /// Create a copy of AppFileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? fileName = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? fileUrl = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _self.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _self.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppFileDto implements AppFileDto {
  const _AppFileDto(
      {required this.id,
      this.userId,
      required this.fileName,
      required this.fileType,
      required this.fileSize,
      required this.fileUrl});
  factory _AppFileDto.fromJson(Map<String, dynamic> json) =>
      _$AppFileDtoFromJson(json);

  @override
  final int id;
  @override
  final int? userId;
  @override
  final String fileName;
  @override
  final String fileType;
  @override
  final int fileSize;
  @override
  final String fileUrl;

  /// Create a copy of AppFileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppFileDtoCopyWith<_AppFileDto> get copyWith =>
      __$AppFileDtoCopyWithImpl<_AppFileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppFileDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppFileDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, fileName, fileType, fileSize, fileUrl);

  @override
  String toString() {
    return 'AppFileDto(id: $id, userId: $userId, fileName: $fileName, fileType: $fileType, fileSize: $fileSize, fileUrl: $fileUrl)';
  }
}

/// @nodoc
abstract mixin class _$AppFileDtoCopyWith<$Res>
    implements $AppFileDtoCopyWith<$Res> {
  factory _$AppFileDtoCopyWith(
          _AppFileDto value, $Res Function(_AppFileDto) _then) =
      __$AppFileDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int? userId,
      String fileName,
      String fileType,
      int fileSize,
      String fileUrl});
}

/// @nodoc
class __$AppFileDtoCopyWithImpl<$Res> implements _$AppFileDtoCopyWith<$Res> {
  __$AppFileDtoCopyWithImpl(this._self, this._then);

  final _AppFileDto _self;
  final $Res Function(_AppFileDto) _then;

  /// Create a copy of AppFileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? fileName = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? fileUrl = null,
  }) {
    return _then(_AppFileDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _self.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _self.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
