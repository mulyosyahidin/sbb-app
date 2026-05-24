// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractDto {
  @IntStringConverter()
  int get id;
  String? get contractNumber;
  @IntStringConverter()
  int get userId;
  String? get userName;
  String? get userIdentityNumber;
  @IntStringConverter()
  int? get userIdentityNumberFileId;
  AppFileDto? get userIdentityNumberFile;
  @IntStringConverter()
  int? get cowId;
  @IntStringConverter()
  int? get cowImageFileId;
  String? get cowName;
  @DoubleStringConverter()
  double? get cowPrice;
  @IntStringConverter()
  int? get cowWeightKg;
  @IntStringConverter()
  int? get cowQuantity;
  @DoubleStringConverter()
  double? get cowTotalPrice;
  @IntStringConverter()
  int? get bankAccountId;
  String? get bankName;
  String? get bankAccountName;
  String? get bankAccountNumber;
  String? get program;
  @IntStringConverter()
  int? get contractMonthDuration;
  String get status;
  String? get note;
  @DoubleStringConverter()
  double? get profitSharingPercentage;
  @DoubleStringConverter()
  double? get totalProfitPaid;
  @IntStringConverter()
  int? get totalProfitPaidMonths;
  List<ContractNoteDto>? get notes;
  @JsonKey(readValue: _readLatestNote)
  ContractNoteDto? get latestNote;
  List<PaymentScheduleDto>? get paymentSchedules;
  DateTime? get startDate;
  DateTime? get endDate;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractDtoCopyWith<ContractDto> get copyWith =>
      _$ContractDtoCopyWithImpl<ContractDto>(this as ContractDto, _$identity);

  /// Serializes this ContractDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userIdentityNumber, userIdentityNumber) ||
                other.userIdentityNumber == userIdentityNumber) &&
            (identical(
                    other.userIdentityNumberFileId, userIdentityNumberFileId) ||
                other.userIdentityNumberFileId == userIdentityNumberFileId) &&
            (identical(other.userIdentityNumberFile, userIdentityNumberFile) ||
                other.userIdentityNumberFile == userIdentityNumberFile) &&
            (identical(other.cowId, cowId) || other.cowId == cowId) &&
            (identical(other.cowImageFileId, cowImageFileId) ||
                other.cowImageFileId == cowImageFileId) &&
            (identical(other.cowName, cowName) || other.cowName == cowName) &&
            (identical(other.cowPrice, cowPrice) ||
                other.cowPrice == cowPrice) &&
            (identical(other.cowWeightKg, cowWeightKg) ||
                other.cowWeightKg == cowWeightKg) &&
            (identical(other.cowQuantity, cowQuantity) ||
                other.cowQuantity == cowQuantity) &&
            (identical(other.cowTotalPrice, cowTotalPrice) ||
                other.cowTotalPrice == cowTotalPrice) &&
            (identical(other.bankAccountId, bankAccountId) ||
                other.bankAccountId == bankAccountId) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.contractMonthDuration, contractMonthDuration) ||
                other.contractMonthDuration == contractMonthDuration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(
                    other.profitSharingPercentage, profitSharingPercentage) ||
                other.profitSharingPercentage == profitSharingPercentage) &&
            (identical(other.totalProfitPaid, totalProfitPaid) ||
                other.totalProfitPaid == totalProfitPaid) &&
            (identical(other.totalProfitPaidMonths, totalProfitPaidMonths) ||
                other.totalProfitPaidMonths == totalProfitPaidMonths) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            (identical(other.latestNote, latestNote) ||
                other.latestNote == latestNote) &&
            const DeepCollectionEquality()
                .equals(other.paymentSchedules, paymentSchedules) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
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
        contractNumber,
        userId,
        userName,
        userIdentityNumber,
        userIdentityNumberFileId,
        userIdentityNumberFile,
        cowId,
        cowImageFileId,
        cowName,
        cowPrice,
        cowWeightKg,
        cowQuantity,
        cowTotalPrice,
        bankAccountId,
        bankName,
        bankAccountName,
        bankAccountNumber,
        program,
        contractMonthDuration,
        status,
        note,
        profitSharingPercentage,
        totalProfitPaid,
        totalProfitPaidMonths,
        const DeepCollectionEquality().hash(notes),
        latestNote,
        const DeepCollectionEquality().hash(paymentSchedules),
        startDate,
        endDate,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ContractDto(id: $id, contractNumber: $contractNumber, userId: $userId, userName: $userName, userIdentityNumber: $userIdentityNumber, userIdentityNumberFileId: $userIdentityNumberFileId, userIdentityNumberFile: $userIdentityNumberFile, cowId: $cowId, cowImageFileId: $cowImageFileId, cowName: $cowName, cowPrice: $cowPrice, cowWeightKg: $cowWeightKg, cowQuantity: $cowQuantity, cowTotalPrice: $cowTotalPrice, bankAccountId: $bankAccountId, bankName: $bankName, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, program: $program, contractMonthDuration: $contractMonthDuration, status: $status, note: $note, profitSharingPercentage: $profitSharingPercentage, totalProfitPaid: $totalProfitPaid, totalProfitPaidMonths: $totalProfitPaidMonths, notes: $notes, latestNote: $latestNote, paymentSchedules: $paymentSchedules, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ContractDtoCopyWith<$Res> {
  factory $ContractDtoCopyWith(
          ContractDto value, $Res Function(ContractDto) _then) =
      _$ContractDtoCopyWithImpl;
  @useResult
  $Res call(
      {@IntStringConverter() int id,
      String? contractNumber,
      @IntStringConverter() int userId,
      String? userName,
      String? userIdentityNumber,
      @IntStringConverter() int? userIdentityNumberFileId,
      AppFileDto? userIdentityNumberFile,
      @IntStringConverter() int? cowId,
      @IntStringConverter() int? cowImageFileId,
      String? cowName,
      @DoubleStringConverter() double? cowPrice,
      @IntStringConverter() int? cowWeightKg,
      @IntStringConverter() int? cowQuantity,
      @DoubleStringConverter() double? cowTotalPrice,
      @IntStringConverter() int? bankAccountId,
      String? bankName,
      String? bankAccountName,
      String? bankAccountNumber,
      String? program,
      @IntStringConverter() int? contractMonthDuration,
      String status,
      String? note,
      @DoubleStringConverter() double? profitSharingPercentage,
      @DoubleStringConverter() double? totalProfitPaid,
      @IntStringConverter() int? totalProfitPaidMonths,
      List<ContractNoteDto>? notes,
      @JsonKey(readValue: _readLatestNote) ContractNoteDto? latestNote,
      List<PaymentScheduleDto>? paymentSchedules,
      DateTime? startDate,
      DateTime? endDate,
      DateTime createdAt,
      DateTime updatedAt});

  $AppFileDtoCopyWith<$Res>? get userIdentityNumberFile;
  $ContractNoteDtoCopyWith<$Res>? get latestNote;
}

/// @nodoc
class _$ContractDtoCopyWithImpl<$Res> implements $ContractDtoCopyWith<$Res> {
  _$ContractDtoCopyWithImpl(this._self, this._then);

  final ContractDto _self;
  final $Res Function(ContractDto) _then;

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contractNumber = freezed,
    Object? userId = null,
    Object? userName = freezed,
    Object? userIdentityNumber = freezed,
    Object? userIdentityNumberFileId = freezed,
    Object? userIdentityNumberFile = freezed,
    Object? cowId = freezed,
    Object? cowImageFileId = freezed,
    Object? cowName = freezed,
    Object? cowPrice = freezed,
    Object? cowWeightKg = freezed,
    Object? cowQuantity = freezed,
    Object? cowTotalPrice = freezed,
    Object? bankAccountId = freezed,
    Object? bankName = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? program = freezed,
    Object? contractMonthDuration = freezed,
    Object? status = null,
    Object? note = freezed,
    Object? profitSharingPercentage = freezed,
    Object? totalProfitPaid = freezed,
    Object? totalProfitPaidMonths = freezed,
    Object? notes = freezed,
    Object? latestNote = freezed,
    Object? paymentSchedules = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contractNumber: freezed == contractNumber
          ? _self.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumber: freezed == userIdentityNumber
          ? _self.userIdentityNumber
          : userIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumberFileId: freezed == userIdentityNumberFileId
          ? _self.userIdentityNumberFileId
          : userIdentityNumberFileId // ignore: cast_nullable_to_non_nullable
              as int?,
      userIdentityNumberFile: freezed == userIdentityNumberFile
          ? _self.userIdentityNumberFile
          : userIdentityNumberFile // ignore: cast_nullable_to_non_nullable
              as AppFileDto?,
      cowId: freezed == cowId
          ? _self.cowId
          : cowId // ignore: cast_nullable_to_non_nullable
              as int?,
      cowImageFileId: freezed == cowImageFileId
          ? _self.cowImageFileId
          : cowImageFileId // ignore: cast_nullable_to_non_nullable
              as int?,
      cowName: freezed == cowName
          ? _self.cowName
          : cowName // ignore: cast_nullable_to_non_nullable
              as String?,
      cowPrice: freezed == cowPrice
          ? _self.cowPrice
          : cowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      cowWeightKg: freezed == cowWeightKg
          ? _self.cowWeightKg
          : cowWeightKg // ignore: cast_nullable_to_non_nullable
              as int?,
      cowQuantity: freezed == cowQuantity
          ? _self.cowQuantity
          : cowQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      cowTotalPrice: freezed == cowTotalPrice
          ? _self.cowTotalPrice
          : cowTotalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      bankAccountId: freezed == bankAccountId
          ? _self.bankAccountId
          : bankAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountName: freezed == bankAccountName
          ? _self.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      program: freezed == program
          ? _self.program
          : program // ignore: cast_nullable_to_non_nullable
              as String?,
      contractMonthDuration: freezed == contractMonthDuration
          ? _self.contractMonthDuration
          : contractMonthDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      profitSharingPercentage: freezed == profitSharingPercentage
          ? _self.profitSharingPercentage
          : profitSharingPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProfitPaid: freezed == totalProfitPaid
          ? _self.totalProfitPaid
          : totalProfitPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProfitPaidMonths: freezed == totalProfitPaidMonths
          ? _self.totalProfitPaidMonths
          : totalProfitPaidMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<ContractNoteDto>?,
      latestNote: freezed == latestNote
          ? _self.latestNote
          : latestNote // ignore: cast_nullable_to_non_nullable
              as ContractNoteDto?,
      paymentSchedules: freezed == paymentSchedules
          ? _self.paymentSchedules
          : paymentSchedules // ignore: cast_nullable_to_non_nullable
              as List<PaymentScheduleDto>?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFileDtoCopyWith<$Res>? get userIdentityNumberFile {
    if (_self.userIdentityNumberFile == null) {
      return null;
    }

    return $AppFileDtoCopyWith<$Res>(_self.userIdentityNumberFile!, (value) {
      return _then(_self.copyWith(userIdentityNumberFile: value));
    });
  }

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractNoteDtoCopyWith<$Res>? get latestNote {
    if (_self.latestNote == null) {
      return null;
    }

    return $ContractNoteDtoCopyWith<$Res>(_self.latestNote!, (value) {
      return _then(_self.copyWith(latestNote: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ContractDto implements ContractDto {
  const _ContractDto(
      {@IntStringConverter() required this.id,
      this.contractNumber,
      @IntStringConverter() required this.userId,
      this.userName,
      this.userIdentityNumber,
      @IntStringConverter() this.userIdentityNumberFileId,
      this.userIdentityNumberFile,
      @IntStringConverter() this.cowId,
      @IntStringConverter() this.cowImageFileId,
      this.cowName,
      @DoubleStringConverter() this.cowPrice,
      @IntStringConverter() this.cowWeightKg,
      @IntStringConverter() this.cowQuantity,
      @DoubleStringConverter() this.cowTotalPrice,
      @IntStringConverter() this.bankAccountId,
      this.bankName,
      this.bankAccountName,
      this.bankAccountNumber,
      this.program,
      @IntStringConverter() this.contractMonthDuration,
      required this.status,
      this.note,
      @DoubleStringConverter() this.profitSharingPercentage,
      @DoubleStringConverter() this.totalProfitPaid,
      @IntStringConverter() this.totalProfitPaidMonths,
      final List<ContractNoteDto>? notes,
      @JsonKey(readValue: _readLatestNote) this.latestNote,
      final List<PaymentScheduleDto>? paymentSchedules,
      this.startDate,
      this.endDate,
      required this.createdAt,
      required this.updatedAt})
      : _notes = notes,
        _paymentSchedules = paymentSchedules;
  factory _ContractDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDtoFromJson(json);

  @override
  @IntStringConverter()
  final int id;
  @override
  final String? contractNumber;
  @override
  @IntStringConverter()
  final int userId;
  @override
  final String? userName;
  @override
  final String? userIdentityNumber;
  @override
  @IntStringConverter()
  final int? userIdentityNumberFileId;
  @override
  final AppFileDto? userIdentityNumberFile;
  @override
  @IntStringConverter()
  final int? cowId;
  @override
  @IntStringConverter()
  final int? cowImageFileId;
  @override
  final String? cowName;
  @override
  @DoubleStringConverter()
  final double? cowPrice;
  @override
  @IntStringConverter()
  final int? cowWeightKg;
  @override
  @IntStringConverter()
  final int? cowQuantity;
  @override
  @DoubleStringConverter()
  final double? cowTotalPrice;
  @override
  @IntStringConverter()
  final int? bankAccountId;
  @override
  final String? bankName;
  @override
  final String? bankAccountName;
  @override
  final String? bankAccountNumber;
  @override
  final String? program;
  @override
  @IntStringConverter()
  final int? contractMonthDuration;
  @override
  final String status;
  @override
  final String? note;
  @override
  @DoubleStringConverter()
  final double? profitSharingPercentage;
  @override
  @DoubleStringConverter()
  final double? totalProfitPaid;
  @override
  @IntStringConverter()
  final int? totalProfitPaidMonths;
  final List<ContractNoteDto>? _notes;
  @override
  List<ContractNoteDto>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(readValue: _readLatestNote)
  final ContractNoteDto? latestNote;
  final List<PaymentScheduleDto>? _paymentSchedules;
  @override
  List<PaymentScheduleDto>? get paymentSchedules {
    final value = _paymentSchedules;
    if (value == null) return null;
    if (_paymentSchedules is EqualUnmodifiableListView)
      return _paymentSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractDtoCopyWith<_ContractDto> get copyWith =>
      __$ContractDtoCopyWithImpl<_ContractDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userIdentityNumber, userIdentityNumber) ||
                other.userIdentityNumber == userIdentityNumber) &&
            (identical(
                    other.userIdentityNumberFileId, userIdentityNumberFileId) ||
                other.userIdentityNumberFileId == userIdentityNumberFileId) &&
            (identical(other.userIdentityNumberFile, userIdentityNumberFile) ||
                other.userIdentityNumberFile == userIdentityNumberFile) &&
            (identical(other.cowId, cowId) || other.cowId == cowId) &&
            (identical(other.cowImageFileId, cowImageFileId) ||
                other.cowImageFileId == cowImageFileId) &&
            (identical(other.cowName, cowName) || other.cowName == cowName) &&
            (identical(other.cowPrice, cowPrice) ||
                other.cowPrice == cowPrice) &&
            (identical(other.cowWeightKg, cowWeightKg) ||
                other.cowWeightKg == cowWeightKg) &&
            (identical(other.cowQuantity, cowQuantity) ||
                other.cowQuantity == cowQuantity) &&
            (identical(other.cowTotalPrice, cowTotalPrice) ||
                other.cowTotalPrice == cowTotalPrice) &&
            (identical(other.bankAccountId, bankAccountId) ||
                other.bankAccountId == bankAccountId) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.contractMonthDuration, contractMonthDuration) ||
                other.contractMonthDuration == contractMonthDuration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(
                    other.profitSharingPercentage, profitSharingPercentage) ||
                other.profitSharingPercentage == profitSharingPercentage) &&
            (identical(other.totalProfitPaid, totalProfitPaid) ||
                other.totalProfitPaid == totalProfitPaid) &&
            (identical(other.totalProfitPaidMonths, totalProfitPaidMonths) ||
                other.totalProfitPaidMonths == totalProfitPaidMonths) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.latestNote, latestNote) ||
                other.latestNote == latestNote) &&
            const DeepCollectionEquality()
                .equals(other._paymentSchedules, _paymentSchedules) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
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
        contractNumber,
        userId,
        userName,
        userIdentityNumber,
        userIdentityNumberFileId,
        userIdentityNumberFile,
        cowId,
        cowImageFileId,
        cowName,
        cowPrice,
        cowWeightKg,
        cowQuantity,
        cowTotalPrice,
        bankAccountId,
        bankName,
        bankAccountName,
        bankAccountNumber,
        program,
        contractMonthDuration,
        status,
        note,
        profitSharingPercentage,
        totalProfitPaid,
        totalProfitPaidMonths,
        const DeepCollectionEquality().hash(_notes),
        latestNote,
        const DeepCollectionEquality().hash(_paymentSchedules),
        startDate,
        endDate,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'ContractDto(id: $id, contractNumber: $contractNumber, userId: $userId, userName: $userName, userIdentityNumber: $userIdentityNumber, userIdentityNumberFileId: $userIdentityNumberFileId, userIdentityNumberFile: $userIdentityNumberFile, cowId: $cowId, cowImageFileId: $cowImageFileId, cowName: $cowName, cowPrice: $cowPrice, cowWeightKg: $cowWeightKg, cowQuantity: $cowQuantity, cowTotalPrice: $cowTotalPrice, bankAccountId: $bankAccountId, bankName: $bankName, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, program: $program, contractMonthDuration: $contractMonthDuration, status: $status, note: $note, profitSharingPercentage: $profitSharingPercentage, totalProfitPaid: $totalProfitPaid, totalProfitPaidMonths: $totalProfitPaidMonths, notes: $notes, latestNote: $latestNote, paymentSchedules: $paymentSchedules, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ContractDtoCopyWith<$Res>
    implements $ContractDtoCopyWith<$Res> {
  factory _$ContractDtoCopyWith(
          _ContractDto value, $Res Function(_ContractDto) _then) =
      __$ContractDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntStringConverter() int id,
      String? contractNumber,
      @IntStringConverter() int userId,
      String? userName,
      String? userIdentityNumber,
      @IntStringConverter() int? userIdentityNumberFileId,
      AppFileDto? userIdentityNumberFile,
      @IntStringConverter() int? cowId,
      @IntStringConverter() int? cowImageFileId,
      String? cowName,
      @DoubleStringConverter() double? cowPrice,
      @IntStringConverter() int? cowWeightKg,
      @IntStringConverter() int? cowQuantity,
      @DoubleStringConverter() double? cowTotalPrice,
      @IntStringConverter() int? bankAccountId,
      String? bankName,
      String? bankAccountName,
      String? bankAccountNumber,
      String? program,
      @IntStringConverter() int? contractMonthDuration,
      String status,
      String? note,
      @DoubleStringConverter() double? profitSharingPercentage,
      @DoubleStringConverter() double? totalProfitPaid,
      @IntStringConverter() int? totalProfitPaidMonths,
      List<ContractNoteDto>? notes,
      @JsonKey(readValue: _readLatestNote) ContractNoteDto? latestNote,
      List<PaymentScheduleDto>? paymentSchedules,
      DateTime? startDate,
      DateTime? endDate,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $AppFileDtoCopyWith<$Res>? get userIdentityNumberFile;
  @override
  $ContractNoteDtoCopyWith<$Res>? get latestNote;
}

/// @nodoc
class __$ContractDtoCopyWithImpl<$Res> implements _$ContractDtoCopyWith<$Res> {
  __$ContractDtoCopyWithImpl(this._self, this._then);

  final _ContractDto _self;
  final $Res Function(_ContractDto) _then;

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? contractNumber = freezed,
    Object? userId = null,
    Object? userName = freezed,
    Object? userIdentityNumber = freezed,
    Object? userIdentityNumberFileId = freezed,
    Object? userIdentityNumberFile = freezed,
    Object? cowId = freezed,
    Object? cowImageFileId = freezed,
    Object? cowName = freezed,
    Object? cowPrice = freezed,
    Object? cowWeightKg = freezed,
    Object? cowQuantity = freezed,
    Object? cowTotalPrice = freezed,
    Object? bankAccountId = freezed,
    Object? bankName = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? program = freezed,
    Object? contractMonthDuration = freezed,
    Object? status = null,
    Object? note = freezed,
    Object? profitSharingPercentage = freezed,
    Object? totalProfitPaid = freezed,
    Object? totalProfitPaidMonths = freezed,
    Object? notes = freezed,
    Object? latestNote = freezed,
    Object? paymentSchedules = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ContractDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contractNumber: freezed == contractNumber
          ? _self.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumber: freezed == userIdentityNumber
          ? _self.userIdentityNumber
          : userIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumberFileId: freezed == userIdentityNumberFileId
          ? _self.userIdentityNumberFileId
          : userIdentityNumberFileId // ignore: cast_nullable_to_non_nullable
              as int?,
      userIdentityNumberFile: freezed == userIdentityNumberFile
          ? _self.userIdentityNumberFile
          : userIdentityNumberFile // ignore: cast_nullable_to_non_nullable
              as AppFileDto?,
      cowId: freezed == cowId
          ? _self.cowId
          : cowId // ignore: cast_nullable_to_non_nullable
              as int?,
      cowImageFileId: freezed == cowImageFileId
          ? _self.cowImageFileId
          : cowImageFileId // ignore: cast_nullable_to_non_nullable
              as int?,
      cowName: freezed == cowName
          ? _self.cowName
          : cowName // ignore: cast_nullable_to_non_nullable
              as String?,
      cowPrice: freezed == cowPrice
          ? _self.cowPrice
          : cowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      cowWeightKg: freezed == cowWeightKg
          ? _self.cowWeightKg
          : cowWeightKg // ignore: cast_nullable_to_non_nullable
              as int?,
      cowQuantity: freezed == cowQuantity
          ? _self.cowQuantity
          : cowQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      cowTotalPrice: freezed == cowTotalPrice
          ? _self.cowTotalPrice
          : cowTotalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      bankAccountId: freezed == bankAccountId
          ? _self.bankAccountId
          : bankAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountName: freezed == bankAccountName
          ? _self.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      program: freezed == program
          ? _self.program
          : program // ignore: cast_nullable_to_non_nullable
              as String?,
      contractMonthDuration: freezed == contractMonthDuration
          ? _self.contractMonthDuration
          : contractMonthDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      profitSharingPercentage: freezed == profitSharingPercentage
          ? _self.profitSharingPercentage
          : profitSharingPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProfitPaid: freezed == totalProfitPaid
          ? _self.totalProfitPaid
          : totalProfitPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProfitPaidMonths: freezed == totalProfitPaidMonths
          ? _self.totalProfitPaidMonths
          : totalProfitPaidMonths // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _self._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<ContractNoteDto>?,
      latestNote: freezed == latestNote
          ? _self.latestNote
          : latestNote // ignore: cast_nullable_to_non_nullable
              as ContractNoteDto?,
      paymentSchedules: freezed == paymentSchedules
          ? _self._paymentSchedules
          : paymentSchedules // ignore: cast_nullable_to_non_nullable
              as List<PaymentScheduleDto>?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppFileDtoCopyWith<$Res>? get userIdentityNumberFile {
    if (_self.userIdentityNumberFile == null) {
      return null;
    }

    return $AppFileDtoCopyWith<$Res>(_self.userIdentityNumberFile!, (value) {
      return _then(_self.copyWith(userIdentityNumberFile: value));
    });
  }

  /// Create a copy of ContractDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractNoteDtoCopyWith<$Res>? get latestNote {
    if (_self.latestNote == null) {
      return null;
    }

    return $ContractNoteDtoCopyWith<$Res>(_self.latestNote!, (value) {
      return _then(_self.copyWith(latestNote: value));
    });
  }
}

// dart format on
