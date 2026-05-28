// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractDocumentDto {
  @IntStringConverter()
  int get id;
  @IntStringConverter()
  int get contractId;
  @IntStringConverter()
  int get fileId;
  AppFileDto? get file;
  String get status;
  String? get note;
  DateTime? get verifiedAt;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ContractDocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractDocumentDtoCopyWith<ContractDocumentDto> get copyWith =>
      _$ContractDocumentDtoCopyWithImpl<ContractDocumentDto>(
          this as ContractDocumentDto, _$identity);

  /// Serializes this ContractDocumentDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractDocumentDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, contractId, fileId, file,
      status, note, verifiedAt, createdAt, updatedAt);

  @override
  String toString() {
    return 'ContractDocumentDto(id: $id, contractId: $contractId, fileId: $fileId, file: $file, status: $status, note: $note, verifiedAt: $verifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ContractDocumentDtoCopyWith<$Res> {
  factory $ContractDocumentDtoCopyWith(
          ContractDocumentDto value, $Res Function(ContractDocumentDto) _then) =
      _$ContractDocumentDtoCopyWithImpl;
  @useResult
  $Res call(
      {@IntStringConverter() int id,
      @IntStringConverter() int contractId,
      @IntStringConverter() int fileId,
      AppFileDto? file,
      String status,
      String? note,
      DateTime? verifiedAt,
      DateTime createdAt,
      DateTime updatedAt});

  $AppFileDtoCopyWith<$Res>? get file;
}

/// @nodoc
class _$ContractDocumentDtoCopyWithImpl<$Res>
    implements $ContractDocumentDtoCopyWith<$Res> {
  _$ContractDocumentDtoCopyWithImpl(this._self, this._then);

  final ContractDocumentDto _self;
  final $Res Function(ContractDocumentDto) _then;

  /// Create a copy of ContractDocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contractId = null,
    Object? fileId = null,
    Object? file = freezed,
    Object? status = null,
    Object? note = freezed,
    Object? verifiedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contractId: null == contractId
          ? _self.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      fileId: null == fileId
          ? _self.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as AppFileDto?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: freezed == verifiedAt
          ? _self.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  /// Create a copy of ContractDocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFileDtoCopyWith<$Res>? get file {
    if (_self.file == null) {
      return null;
    }

    return $AppFileDtoCopyWith<$Res>(_self.file!, (value) {
      return _then(_self.copyWith(file: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ContractDocumentDto implements ContractDocumentDto {
  const _ContractDocumentDto(
      {@IntStringConverter() required this.id,
      @IntStringConverter() required this.contractId,
      @IntStringConverter() required this.fileId,
      this.file,
      required this.status,
      this.note,
      this.verifiedAt,
      required this.createdAt,
      required this.updatedAt});
  factory _ContractDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDocumentDtoFromJson(json);

  @override
  @IntStringConverter()
  final int id;
  @override
  @IntStringConverter()
  final int contractId;
  @override
  @IntStringConverter()
  final int fileId;
  @override
  final AppFileDto? file;
  @override
  final String status;
  @override
  final String? note;
  @override
  final DateTime? verifiedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ContractDocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractDocumentDtoCopyWith<_ContractDocumentDto> get copyWith =>
      __$ContractDocumentDtoCopyWithImpl<_ContractDocumentDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractDocumentDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractDocumentDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, contractId, fileId, file,
      status, note, verifiedAt, createdAt, updatedAt);

  @override
  String toString() {
    return 'ContractDocumentDto(id: $id, contractId: $contractId, fileId: $fileId, file: $file, status: $status, note: $note, verifiedAt: $verifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ContractDocumentDtoCopyWith<$Res>
    implements $ContractDocumentDtoCopyWith<$Res> {
  factory _$ContractDocumentDtoCopyWith(_ContractDocumentDto value,
          $Res Function(_ContractDocumentDto) _then) =
      __$ContractDocumentDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntStringConverter() int id,
      @IntStringConverter() int contractId,
      @IntStringConverter() int fileId,
      AppFileDto? file,
      String status,
      String? note,
      DateTime? verifiedAt,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $AppFileDtoCopyWith<$Res>? get file;
}

/// @nodoc
class __$ContractDocumentDtoCopyWithImpl<$Res>
    implements _$ContractDocumentDtoCopyWith<$Res> {
  __$ContractDocumentDtoCopyWithImpl(this._self, this._then);

  final _ContractDocumentDto _self;
  final $Res Function(_ContractDocumentDto) _then;

  /// Create a copy of ContractDocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? contractId = null,
    Object? fileId = null,
    Object? file = freezed,
    Object? status = null,
    Object? note = freezed,
    Object? verifiedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ContractDocumentDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contractId: null == contractId
          ? _self.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      fileId: null == fileId
          ? _self.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as AppFileDto?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: freezed == verifiedAt
          ? _self.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  /// Create a copy of ContractDocumentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFileDtoCopyWith<$Res>? get file {
    if (_self.file == null) {
      return null;
    }

    return $AppFileDtoCopyWith<$Res>(_self.file!, (value) {
      return _then(_self.copyWith(file: value));
    });
  }
}

// dart format on
