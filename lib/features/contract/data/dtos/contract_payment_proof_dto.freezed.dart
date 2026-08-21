// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_payment_proof_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractPaymentProofDto {
  @IntStringConverter()
  int? get id;
  @IntStringConverter()
  int? get contractId;
  @IntStringConverter()
  int? get fileId;
  AppFileDto? get file;
  String get bankName;
  String get bankAccountName;
  String get bankAccountNumber;
  @DoubleStringConverter()
  double? get nominal;
  String get status;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ContractPaymentProofDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractPaymentProofDtoCopyWith<ContractPaymentProofDto> get copyWith =>
      _$ContractPaymentProofDtoCopyWithImpl<ContractPaymentProofDto>(
          this as ContractPaymentProofDto, _$identity);

  /// Serializes this ContractPaymentProofDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractPaymentProofDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.status, status) || other.status == status) &&
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
      contractId,
      fileId,
      file,
      bankName,
      bankAccountName,
      bankAccountNumber,
      nominal,
      status,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ContractPaymentProofDto(id: $id, contractId: $contractId, fileId: $fileId, file: $file, bankName: $bankName, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, nominal: $nominal, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ContractPaymentProofDtoCopyWith<$Res> {
  factory $ContractPaymentProofDtoCopyWith(ContractPaymentProofDto value,
          $Res Function(ContractPaymentProofDto) _then) =
      _$ContractPaymentProofDtoCopyWithImpl;
  @useResult
  $Res call(
      {@IntStringConverter() int? id,
      @IntStringConverter() int? contractId,
      @IntStringConverter() int? fileId,
      AppFileDto? file,
      String bankName,
      String bankAccountName,
      String bankAccountNumber,
      @DoubleStringConverter() double? nominal,
      String status,
      DateTime createdAt,
      DateTime updatedAt});

  $AppFileDtoCopyWith<$Res>? get file;
}

/// @nodoc
class _$ContractPaymentProofDtoCopyWithImpl<$Res>
    implements $ContractPaymentProofDtoCopyWith<$Res> {
  _$ContractPaymentProofDtoCopyWithImpl(this._self, this._then);

  final ContractPaymentProofDto _self;
  final $Res Function(ContractPaymentProofDto) _then;

  /// Create a copy of ContractPaymentProofDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contractId = freezed,
    Object? fileId = freezed,
    Object? file = freezed,
    Object? bankName = null,
    Object? bankAccountName = null,
    Object? bankAccountNumber = null,
    Object? nominal = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contractId: freezed == contractId
          ? _self.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileId: freezed == fileId
          ? _self.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as AppFileDto?,
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountName: null == bankAccountName
          ? _self.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNumber: null == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nominal: freezed == nominal
          ? _self.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of ContractPaymentProofDto
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
class _ContractPaymentProofDto implements ContractPaymentProofDto {
  const _ContractPaymentProofDto(
      {@IntStringConverter() this.id,
      @IntStringConverter() this.contractId,
      @IntStringConverter() this.fileId,
      this.file,
      required this.bankName,
      required this.bankAccountName,
      required this.bankAccountNumber,
      @DoubleStringConverter() this.nominal,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  factory _ContractPaymentProofDto.fromJson(Map<String, dynamic> json) =>
      _$ContractPaymentProofDtoFromJson(json);

  @override
  @IntStringConverter()
  final int? id;
  @override
  @IntStringConverter()
  final int? contractId;
  @override
  @IntStringConverter()
  final int? fileId;
  @override
  final AppFileDto? file;
  @override
  final String bankName;
  @override
  final String bankAccountName;
  @override
  final String bankAccountNumber;
  @override
  @DoubleStringConverter()
  final double? nominal;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ContractPaymentProofDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractPaymentProofDtoCopyWith<_ContractPaymentProofDto> get copyWith =>
      __$ContractPaymentProofDtoCopyWithImpl<_ContractPaymentProofDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractPaymentProofDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractPaymentProofDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.status, status) || other.status == status) &&
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
      contractId,
      fileId,
      file,
      bankName,
      bankAccountName,
      bankAccountNumber,
      nominal,
      status,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ContractPaymentProofDto(id: $id, contractId: $contractId, fileId: $fileId, file: $file, bankName: $bankName, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, nominal: $nominal, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ContractPaymentProofDtoCopyWith<$Res>
    implements $ContractPaymentProofDtoCopyWith<$Res> {
  factory _$ContractPaymentProofDtoCopyWith(_ContractPaymentProofDto value,
          $Res Function(_ContractPaymentProofDto) _then) =
      __$ContractPaymentProofDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntStringConverter() int? id,
      @IntStringConverter() int? contractId,
      @IntStringConverter() int? fileId,
      AppFileDto? file,
      String bankName,
      String bankAccountName,
      String bankAccountNumber,
      @DoubleStringConverter() double? nominal,
      String status,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $AppFileDtoCopyWith<$Res>? get file;
}

/// @nodoc
class __$ContractPaymentProofDtoCopyWithImpl<$Res>
    implements _$ContractPaymentProofDtoCopyWith<$Res> {
  __$ContractPaymentProofDtoCopyWithImpl(this._self, this._then);

  final _ContractPaymentProofDto _self;
  final $Res Function(_ContractPaymentProofDto) _then;

  /// Create a copy of ContractPaymentProofDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? contractId = freezed,
    Object? fileId = freezed,
    Object? file = freezed,
    Object? bankName = null,
    Object? bankAccountName = null,
    Object? bankAccountNumber = null,
    Object? nominal = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ContractPaymentProofDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contractId: freezed == contractId
          ? _self.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileId: freezed == fileId
          ? _self.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as int?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as AppFileDto?,
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountName: null == bankAccountName
          ? _self.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNumber: null == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nominal: freezed == nominal
          ? _self.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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

  /// Create a copy of ContractPaymentProofDto
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
