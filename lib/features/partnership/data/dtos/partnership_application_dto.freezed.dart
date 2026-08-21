// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partnership_application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnershipIdentityCardFileDto {
  @JsonKey(fromJson: _intFromJson)
  int get id;
  @JsonKey(fromJson: _stringFromJson)
  String get fileName;
  @JsonKey(fromJson: _stringFromJson)
  String get fileType;
  @JsonKey(fromJson: _stringFromJson)
  String get fileSize;
  @JsonKey(fromJson: _stringFromJson)
  String get fileUrl;

  /// Create a copy of PartnershipIdentityCardFileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnershipIdentityCardFileDtoCopyWith<PartnershipIdentityCardFileDto>
      get copyWith => _$PartnershipIdentityCardFileDtoCopyWithImpl<
              PartnershipIdentityCardFileDto>(
          this as PartnershipIdentityCardFileDto, _$identity);

  /// Serializes this PartnershipIdentityCardFileDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnershipIdentityCardFileDto &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, fileType, fileSize, fileUrl);

  @override
  String toString() {
    return 'PartnershipIdentityCardFileDto(id: $id, fileName: $fileName, fileType: $fileType, fileSize: $fileSize, fileUrl: $fileUrl)';
  }
}

/// @nodoc
abstract mixin class $PartnershipIdentityCardFileDtoCopyWith<$Res> {
  factory $PartnershipIdentityCardFileDtoCopyWith(
          PartnershipIdentityCardFileDto value,
          $Res Function(PartnershipIdentityCardFileDto) _then) =
      _$PartnershipIdentityCardFileDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _stringFromJson) String fileName,
      @JsonKey(fromJson: _stringFromJson) String fileType,
      @JsonKey(fromJson: _stringFromJson) String fileSize,
      @JsonKey(fromJson: _stringFromJson) String fileUrl});
}

/// @nodoc
class _$PartnershipIdentityCardFileDtoCopyWithImpl<$Res>
    implements $PartnershipIdentityCardFileDtoCopyWith<$Res> {
  _$PartnershipIdentityCardFileDtoCopyWithImpl(this._self, this._then);

  final PartnershipIdentityCardFileDto _self;
  final $Res Function(PartnershipIdentityCardFileDto) _then;

  /// Create a copy of PartnershipIdentityCardFileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
              as String,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PartnershipIdentityCardFileDto
    implements PartnershipIdentityCardFileDto {
  const _PartnershipIdentityCardFileDto(
      {@JsonKey(fromJson: _intFromJson) required this.id,
      @JsonKey(fromJson: _stringFromJson) required this.fileName,
      @JsonKey(fromJson: _stringFromJson) required this.fileType,
      @JsonKey(fromJson: _stringFromJson) required this.fileSize,
      @JsonKey(fromJson: _stringFromJson) required this.fileUrl});
  factory _PartnershipIdentityCardFileDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipIdentityCardFileDtoFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String fileName;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String fileType;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String fileSize;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String fileUrl;

  /// Create a copy of PartnershipIdentityCardFileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartnershipIdentityCardFileDtoCopyWith<_PartnershipIdentityCardFileDto>
      get copyWith => __$PartnershipIdentityCardFileDtoCopyWithImpl<
          _PartnershipIdentityCardFileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartnershipIdentityCardFileDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartnershipIdentityCardFileDto &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, fileType, fileSize, fileUrl);

  @override
  String toString() {
    return 'PartnershipIdentityCardFileDto(id: $id, fileName: $fileName, fileType: $fileType, fileSize: $fileSize, fileUrl: $fileUrl)';
  }
}

/// @nodoc
abstract mixin class _$PartnershipIdentityCardFileDtoCopyWith<$Res>
    implements $PartnershipIdentityCardFileDtoCopyWith<$Res> {
  factory _$PartnershipIdentityCardFileDtoCopyWith(
          _PartnershipIdentityCardFileDto value,
          $Res Function(_PartnershipIdentityCardFileDto) _then) =
      __$PartnershipIdentityCardFileDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _stringFromJson) String fileName,
      @JsonKey(fromJson: _stringFromJson) String fileType,
      @JsonKey(fromJson: _stringFromJson) String fileSize,
      @JsonKey(fromJson: _stringFromJson) String fileUrl});
}

/// @nodoc
class __$PartnershipIdentityCardFileDtoCopyWithImpl<$Res>
    implements _$PartnershipIdentityCardFileDtoCopyWith<$Res> {
  __$PartnershipIdentityCardFileDtoCopyWithImpl(this._self, this._then);

  final _PartnershipIdentityCardFileDto _self;
  final $Res Function(_PartnershipIdentityCardFileDto) _then;

  /// Create a copy of PartnershipIdentityCardFileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileType = null,
    Object? fileSize = null,
    Object? fileUrl = null,
  }) {
    return _then(_PartnershipIdentityCardFileDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as String,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PartnershipApplicationDto {
  @JsonKey(fromJson: _intFromJson)
  int get id;
  @JsonKey(fromJson: _intFromJson)
  int get userId;
  @JsonKey(fromJson: _nullableIntFromJson)
  int? get fromLevel;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get fromLevelLabel;
  @JsonKey(fromJson: _intFromJson)
  int get toLevel;
  @JsonKey(fromJson: _stringFromJson)
  String get toLevelLabel;
  @JsonKey(fromJson: _stringFromJson)
  String get type;
  @JsonKey(fromJson: _stringFromJson)
  String get typeLabel;
  @JsonKey(fromJson: _stringFromJson)
  String get status;
  @JsonKey(fromJson: _stringFromJson)
  String get statusLabel;
  @JsonKey(fromJson: _stringFromJson)
  String get name;
  @JsonKey(fromJson: _stringFromJson)
  String get nik;
  @JsonKey(fromJson: _stringFromJson)
  String get address;
  PartnershipIdentityCardFileDto? get identityCardFile;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get note;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get submittedAt;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get lastSubmittedAt;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get reviewedAt;
  PartnershipReviewerDto? get reviewedBy;
  List<PartnershipApplicationReviewDto> get reviews;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get createdAt;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get updatedAt;

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnershipApplicationDtoCopyWith<PartnershipApplicationDto> get copyWith =>
      _$PartnershipApplicationDtoCopyWithImpl<PartnershipApplicationDto>(
          this as PartnershipApplicationDto, _$identity);

  /// Serializes this PartnershipApplicationDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnershipApplicationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fromLevel, fromLevel) ||
                other.fromLevel == fromLevel) &&
            (identical(other.fromLevelLabel, fromLevelLabel) ||
                other.fromLevelLabel == fromLevelLabel) &&
            (identical(other.toLevel, toLevel) || other.toLevel == toLevel) &&
            (identical(other.toLevelLabel, toLevelLabel) ||
                other.toLevelLabel == toLevelLabel) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeLabel, typeLabel) ||
                other.typeLabel == typeLabel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityCardFile, identityCardFile) ||
                other.identityCardFile == identityCardFile) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.lastSubmittedAt, lastSubmittedAt) ||
                other.lastSubmittedAt == lastSubmittedAt) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        fromLevel,
        fromLevelLabel,
        toLevel,
        toLevelLabel,
        type,
        typeLabel,
        status,
        statusLabel,
        name,
        nik,
        address,
        identityCardFile,
        note,
        submittedAt,
        lastSubmittedAt,
        reviewedAt,
        reviewedBy,
        const DeepCollectionEquality().hash(reviews),
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'PartnershipApplicationDto(id: $id, userId: $userId, fromLevel: $fromLevel, fromLevelLabel: $fromLevelLabel, toLevel: $toLevel, toLevelLabel: $toLevelLabel, type: $type, typeLabel: $typeLabel, status: $status, statusLabel: $statusLabel, name: $name, nik: $nik, address: $address, identityCardFile: $identityCardFile, note: $note, submittedAt: $submittedAt, lastSubmittedAt: $lastSubmittedAt, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, reviews: $reviews, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PartnershipApplicationDtoCopyWith<$Res> {
  factory $PartnershipApplicationDtoCopyWith(PartnershipApplicationDto value,
          $Res Function(PartnershipApplicationDto) _then) =
      _$PartnershipApplicationDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _intFromJson) int userId,
      @JsonKey(fromJson: _nullableIntFromJson) int? fromLevel,
      @JsonKey(fromJson: _nullableStringFromJson) String? fromLevelLabel,
      @JsonKey(fromJson: _intFromJson) int toLevel,
      @JsonKey(fromJson: _stringFromJson) String toLevelLabel,
      @JsonKey(fromJson: _stringFromJson) String type,
      @JsonKey(fromJson: _stringFromJson) String typeLabel,
      @JsonKey(fromJson: _stringFromJson) String status,
      @JsonKey(fromJson: _stringFromJson) String statusLabel,
      @JsonKey(fromJson: _stringFromJson) String name,
      @JsonKey(fromJson: _stringFromJson) String nik,
      @JsonKey(fromJson: _stringFromJson) String address,
      PartnershipIdentityCardFileDto? identityCardFile,
      @JsonKey(fromJson: _nullableStringFromJson) String? note,
      @JsonKey(fromJson: _nullableStringFromJson) String? submittedAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? lastSubmittedAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? reviewedAt,
      PartnershipReviewerDto? reviewedBy,
      List<PartnershipApplicationReviewDto> reviews,
      @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt});

  $PartnershipIdentityCardFileDtoCopyWith<$Res>? get identityCardFile;
  $PartnershipReviewerDtoCopyWith<$Res>? get reviewedBy;
}

/// @nodoc
class _$PartnershipApplicationDtoCopyWithImpl<$Res>
    implements $PartnershipApplicationDtoCopyWith<$Res> {
  _$PartnershipApplicationDtoCopyWithImpl(this._self, this._then);

  final PartnershipApplicationDto _self;
  final $Res Function(PartnershipApplicationDto) _then;

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fromLevel = freezed,
    Object? fromLevelLabel = freezed,
    Object? toLevel = null,
    Object? toLevelLabel = null,
    Object? type = null,
    Object? typeLabel = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? identityCardFile = freezed,
    Object? note = freezed,
    Object? submittedAt = freezed,
    Object? lastSubmittedAt = freezed,
    Object? reviewedAt = freezed,
    Object? reviewedBy = freezed,
    Object? reviews = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fromLevel: freezed == fromLevel
          ? _self.fromLevel
          : fromLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      fromLevelLabel: freezed == fromLevelLabel
          ? _self.fromLevelLabel
          : fromLevelLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      toLevel: null == toLevel
          ? _self.toLevel
          : toLevel // ignore: cast_nullable_to_non_nullable
              as int,
      toLevelLabel: null == toLevelLabel
          ? _self.toLevelLabel
          : toLevelLabel // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      typeLabel: null == typeLabel
          ? _self.typeLabel
          : typeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _self.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
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
              as PartnershipIdentityCardFileDto?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSubmittedAt: freezed == lastSubmittedAt
          ? _self.lastSubmittedAt
          : lastSubmittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedAt: freezed == reviewedAt
          ? _self.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedBy: freezed == reviewedBy
          ? _self.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as PartnershipReviewerDto?,
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<PartnershipApplicationReviewDto>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipIdentityCardFileDtoCopyWith<$Res>? get identityCardFile {
    if (_self.identityCardFile == null) {
      return null;
    }

    return $PartnershipIdentityCardFileDtoCopyWith<$Res>(
        _self.identityCardFile!, (value) {
      return _then(_self.copyWith(identityCardFile: value));
    });
  }

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipReviewerDtoCopyWith<$Res>? get reviewedBy {
    if (_self.reviewedBy == null) {
      return null;
    }

    return $PartnershipReviewerDtoCopyWith<$Res>(_self.reviewedBy!, (value) {
      return _then(_self.copyWith(reviewedBy: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PartnershipApplicationDto implements PartnershipApplicationDto {
  const _PartnershipApplicationDto(
      {@JsonKey(fromJson: _intFromJson) required this.id,
      @JsonKey(fromJson: _intFromJson) required this.userId,
      @JsonKey(fromJson: _nullableIntFromJson) this.fromLevel,
      @JsonKey(fromJson: _nullableStringFromJson) this.fromLevelLabel,
      @JsonKey(fromJson: _intFromJson) required this.toLevel,
      @JsonKey(fromJson: _stringFromJson) required this.toLevelLabel,
      @JsonKey(fromJson: _stringFromJson) required this.type,
      @JsonKey(fromJson: _stringFromJson) required this.typeLabel,
      @JsonKey(fromJson: _stringFromJson) required this.status,
      @JsonKey(fromJson: _stringFromJson) required this.statusLabel,
      @JsonKey(fromJson: _stringFromJson) required this.name,
      @JsonKey(fromJson: _stringFromJson) required this.nik,
      @JsonKey(fromJson: _stringFromJson) required this.address,
      this.identityCardFile,
      @JsonKey(fromJson: _nullableStringFromJson) this.note,
      @JsonKey(fromJson: _nullableStringFromJson) this.submittedAt,
      @JsonKey(fromJson: _nullableStringFromJson) this.lastSubmittedAt,
      @JsonKey(fromJson: _nullableStringFromJson) this.reviewedAt,
      this.reviewedBy,
      final List<PartnershipApplicationReviewDto> reviews = const [],
      @JsonKey(fromJson: _nullableStringFromJson) this.createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) this.updatedAt})
      : _reviews = reviews;
  factory _PartnershipApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipApplicationDtoFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int userId;
  @override
  @JsonKey(fromJson: _nullableIntFromJson)
  final int? fromLevel;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? fromLevelLabel;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int toLevel;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String toLevelLabel;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String type;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String typeLabel;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String status;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String statusLabel;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String name;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String nik;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String address;
  @override
  final PartnershipIdentityCardFileDto? identityCardFile;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? note;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? submittedAt;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? lastSubmittedAt;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? reviewedAt;
  @override
  final PartnershipReviewerDto? reviewedBy;
  final List<PartnershipApplicationReviewDto> _reviews;
  @override
  @JsonKey()
  List<PartnershipApplicationReviewDto> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? createdAt;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? updatedAt;

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartnershipApplicationDtoCopyWith<_PartnershipApplicationDto>
      get copyWith =>
          __$PartnershipApplicationDtoCopyWithImpl<_PartnershipApplicationDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartnershipApplicationDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartnershipApplicationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fromLevel, fromLevel) ||
                other.fromLevel == fromLevel) &&
            (identical(other.fromLevelLabel, fromLevelLabel) ||
                other.fromLevelLabel == fromLevelLabel) &&
            (identical(other.toLevel, toLevel) || other.toLevel == toLevel) &&
            (identical(other.toLevelLabel, toLevelLabel) ||
                other.toLevelLabel == toLevelLabel) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeLabel, typeLabel) ||
                other.typeLabel == typeLabel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityCardFile, identityCardFile) ||
                other.identityCardFile == identityCardFile) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.lastSubmittedAt, lastSubmittedAt) ||
                other.lastSubmittedAt == lastSubmittedAt) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        fromLevel,
        fromLevelLabel,
        toLevel,
        toLevelLabel,
        type,
        typeLabel,
        status,
        statusLabel,
        name,
        nik,
        address,
        identityCardFile,
        note,
        submittedAt,
        lastSubmittedAt,
        reviewedAt,
        reviewedBy,
        const DeepCollectionEquality().hash(_reviews),
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'PartnershipApplicationDto(id: $id, userId: $userId, fromLevel: $fromLevel, fromLevelLabel: $fromLevelLabel, toLevel: $toLevel, toLevelLabel: $toLevelLabel, type: $type, typeLabel: $typeLabel, status: $status, statusLabel: $statusLabel, name: $name, nik: $nik, address: $address, identityCardFile: $identityCardFile, note: $note, submittedAt: $submittedAt, lastSubmittedAt: $lastSubmittedAt, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, reviews: $reviews, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PartnershipApplicationDtoCopyWith<$Res>
    implements $PartnershipApplicationDtoCopyWith<$Res> {
  factory _$PartnershipApplicationDtoCopyWith(_PartnershipApplicationDto value,
          $Res Function(_PartnershipApplicationDto) _then) =
      __$PartnershipApplicationDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _intFromJson) int userId,
      @JsonKey(fromJson: _nullableIntFromJson) int? fromLevel,
      @JsonKey(fromJson: _nullableStringFromJson) String? fromLevelLabel,
      @JsonKey(fromJson: _intFromJson) int toLevel,
      @JsonKey(fromJson: _stringFromJson) String toLevelLabel,
      @JsonKey(fromJson: _stringFromJson) String type,
      @JsonKey(fromJson: _stringFromJson) String typeLabel,
      @JsonKey(fromJson: _stringFromJson) String status,
      @JsonKey(fromJson: _stringFromJson) String statusLabel,
      @JsonKey(fromJson: _stringFromJson) String name,
      @JsonKey(fromJson: _stringFromJson) String nik,
      @JsonKey(fromJson: _stringFromJson) String address,
      PartnershipIdentityCardFileDto? identityCardFile,
      @JsonKey(fromJson: _nullableStringFromJson) String? note,
      @JsonKey(fromJson: _nullableStringFromJson) String? submittedAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? lastSubmittedAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? reviewedAt,
      PartnershipReviewerDto? reviewedBy,
      List<PartnershipApplicationReviewDto> reviews,
      @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt});

  @override
  $PartnershipIdentityCardFileDtoCopyWith<$Res>? get identityCardFile;
  @override
  $PartnershipReviewerDtoCopyWith<$Res>? get reviewedBy;
}

/// @nodoc
class __$PartnershipApplicationDtoCopyWithImpl<$Res>
    implements _$PartnershipApplicationDtoCopyWith<$Res> {
  __$PartnershipApplicationDtoCopyWithImpl(this._self, this._then);

  final _PartnershipApplicationDto _self;
  final $Res Function(_PartnershipApplicationDto) _then;

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fromLevel = freezed,
    Object? fromLevelLabel = freezed,
    Object? toLevel = null,
    Object? toLevelLabel = null,
    Object? type = null,
    Object? typeLabel = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? name = null,
    Object? nik = null,
    Object? address = null,
    Object? identityCardFile = freezed,
    Object? note = freezed,
    Object? submittedAt = freezed,
    Object? lastSubmittedAt = freezed,
    Object? reviewedAt = freezed,
    Object? reviewedBy = freezed,
    Object? reviews = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_PartnershipApplicationDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fromLevel: freezed == fromLevel
          ? _self.fromLevel
          : fromLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      fromLevelLabel: freezed == fromLevelLabel
          ? _self.fromLevelLabel
          : fromLevelLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      toLevel: null == toLevel
          ? _self.toLevel
          : toLevel // ignore: cast_nullable_to_non_nullable
              as int,
      toLevelLabel: null == toLevelLabel
          ? _self.toLevelLabel
          : toLevelLabel // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      typeLabel: null == typeLabel
          ? _self.typeLabel
          : typeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _self.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
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
              as PartnershipIdentityCardFileDto?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSubmittedAt: freezed == lastSubmittedAt
          ? _self.lastSubmittedAt
          : lastSubmittedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedAt: freezed == reviewedAt
          ? _self.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedBy: freezed == reviewedBy
          ? _self.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as PartnershipReviewerDto?,
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<PartnershipApplicationReviewDto>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipIdentityCardFileDtoCopyWith<$Res>? get identityCardFile {
    if (_self.identityCardFile == null) {
      return null;
    }

    return $PartnershipIdentityCardFileDtoCopyWith<$Res>(
        _self.identityCardFile!, (value) {
      return _then(_self.copyWith(identityCardFile: value));
    });
  }

  /// Create a copy of PartnershipApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipReviewerDtoCopyWith<$Res>? get reviewedBy {
    if (_self.reviewedBy == null) {
      return null;
    }

    return $PartnershipReviewerDtoCopyWith<$Res>(_self.reviewedBy!, (value) {
      return _then(_self.copyWith(reviewedBy: value));
    });
  }
}

// dart format on
