// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_draft_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveDraftRequestDto {
  String? get userName;
  String? get userIdentityNumber;
  String? get address;
  @JsonKey(includeFromJson: false, includeToJson: false)
  File? get userIdentityNumberFile;
  int? get cowId;
  int? get cowQuantity;
  double? get cowTotalPrice;
  int? get bankAccountId;
  String? get program;
  int? get contractMonthDuration;
  bool? get deleteUserIdentityNumberFile;

  /// Create a copy of SaveDraftRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaveDraftRequestDtoCopyWith<SaveDraftRequestDto> get copyWith =>
      _$SaveDraftRequestDtoCopyWithImpl<SaveDraftRequestDto>(
          this as SaveDraftRequestDto, _$identity);

  /// Serializes this SaveDraftRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveDraftRequestDto &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userIdentityNumber, userIdentityNumber) ||
                other.userIdentityNumber == userIdentityNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.userIdentityNumberFile, userIdentityNumberFile) ||
                other.userIdentityNumberFile == userIdentityNumberFile) &&
            (identical(other.cowId, cowId) || other.cowId == cowId) &&
            (identical(other.cowQuantity, cowQuantity) ||
                other.cowQuantity == cowQuantity) &&
            (identical(other.cowTotalPrice, cowTotalPrice) ||
                other.cowTotalPrice == cowTotalPrice) &&
            (identical(other.bankAccountId, bankAccountId) ||
                other.bankAccountId == bankAccountId) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.contractMonthDuration, contractMonthDuration) ||
                other.contractMonthDuration == contractMonthDuration) &&
            (identical(other.deleteUserIdentityNumberFile,
                    deleteUserIdentityNumberFile) ||
                other.deleteUserIdentityNumberFile ==
                    deleteUserIdentityNumberFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      userIdentityNumber,
      address,
      userIdentityNumberFile,
      cowId,
      cowQuantity,
      cowTotalPrice,
      bankAccountId,
      program,
      contractMonthDuration,
      deleteUserIdentityNumberFile);

  @override
  String toString() {
    return 'SaveDraftRequestDto(userName: $userName, userIdentityNumber: $userIdentityNumber, address: $address, userIdentityNumberFile: $userIdentityNumberFile, cowId: $cowId, cowQuantity: $cowQuantity, cowTotalPrice: $cowTotalPrice, bankAccountId: $bankAccountId, program: $program, contractMonthDuration: $contractMonthDuration, deleteUserIdentityNumberFile: $deleteUserIdentityNumberFile)';
  }
}

/// @nodoc
abstract mixin class $SaveDraftRequestDtoCopyWith<$Res> {
  factory $SaveDraftRequestDtoCopyWith(
          SaveDraftRequestDto value, $Res Function(SaveDraftRequestDto) _then) =
      _$SaveDraftRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String? userName,
      String? userIdentityNumber,
      String? address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? userIdentityNumberFile,
      int? cowId,
      int? cowQuantity,
      double? cowTotalPrice,
      int? bankAccountId,
      String? program,
      int? contractMonthDuration,
      bool? deleteUserIdentityNumberFile});
}

/// @nodoc
class _$SaveDraftRequestDtoCopyWithImpl<$Res>
    implements $SaveDraftRequestDtoCopyWith<$Res> {
  _$SaveDraftRequestDtoCopyWithImpl(this._self, this._then);

  final SaveDraftRequestDto _self;
  final $Res Function(SaveDraftRequestDto) _then;

  /// Create a copy of SaveDraftRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? userIdentityNumber = freezed,
    Object? address = freezed,
    Object? userIdentityNumberFile = freezed,
    Object? cowId = freezed,
    Object? cowQuantity = freezed,
    Object? cowTotalPrice = freezed,
    Object? bankAccountId = freezed,
    Object? program = freezed,
    Object? contractMonthDuration = freezed,
    Object? deleteUserIdentityNumberFile = freezed,
  }) {
    return _then(_self.copyWith(
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumber: freezed == userIdentityNumber
          ? _self.userIdentityNumber
          : userIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumberFile: freezed == userIdentityNumberFile
          ? _self.userIdentityNumberFile
          : userIdentityNumberFile // ignore: cast_nullable_to_non_nullable
              as File?,
      cowId: freezed == cowId
          ? _self.cowId
          : cowId // ignore: cast_nullable_to_non_nullable
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
      program: freezed == program
          ? _self.program
          : program // ignore: cast_nullable_to_non_nullable
              as String?,
      contractMonthDuration: freezed == contractMonthDuration
          ? _self.contractMonthDuration
          : contractMonthDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteUserIdentityNumberFile: freezed == deleteUserIdentityNumberFile
          ? _self.deleteUserIdentityNumberFile
          : deleteUserIdentityNumberFile // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SaveDraftRequestDto implements SaveDraftRequestDto {
  const _SaveDraftRequestDto(
      {this.userName,
      this.userIdentityNumber,
      this.address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.userIdentityNumberFile,
      this.cowId,
      this.cowQuantity,
      this.cowTotalPrice,
      this.bankAccountId,
      this.program,
      this.contractMonthDuration,
      this.deleteUserIdentityNumberFile});
  factory _SaveDraftRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SaveDraftRequestDtoFromJson(json);

  @override
  final String? userName;
  @override
  final String? userIdentityNumber;
  @override
  final String? address;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? userIdentityNumberFile;
  @override
  final int? cowId;
  @override
  final int? cowQuantity;
  @override
  final double? cowTotalPrice;
  @override
  final int? bankAccountId;
  @override
  final String? program;
  @override
  final int? contractMonthDuration;
  @override
  final bool? deleteUserIdentityNumberFile;

  /// Create a copy of SaveDraftRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaveDraftRequestDtoCopyWith<_SaveDraftRequestDto> get copyWith =>
      __$SaveDraftRequestDtoCopyWithImpl<_SaveDraftRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SaveDraftRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveDraftRequestDto &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userIdentityNumber, userIdentityNumber) ||
                other.userIdentityNumber == userIdentityNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.userIdentityNumberFile, userIdentityNumberFile) ||
                other.userIdentityNumberFile == userIdentityNumberFile) &&
            (identical(other.cowId, cowId) || other.cowId == cowId) &&
            (identical(other.cowQuantity, cowQuantity) ||
                other.cowQuantity == cowQuantity) &&
            (identical(other.cowTotalPrice, cowTotalPrice) ||
                other.cowTotalPrice == cowTotalPrice) &&
            (identical(other.bankAccountId, bankAccountId) ||
                other.bankAccountId == bankAccountId) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.contractMonthDuration, contractMonthDuration) ||
                other.contractMonthDuration == contractMonthDuration) &&
            (identical(other.deleteUserIdentityNumberFile,
                    deleteUserIdentityNumberFile) ||
                other.deleteUserIdentityNumberFile ==
                    deleteUserIdentityNumberFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      userIdentityNumber,
      address,
      userIdentityNumberFile,
      cowId,
      cowQuantity,
      cowTotalPrice,
      bankAccountId,
      program,
      contractMonthDuration,
      deleteUserIdentityNumberFile);

  @override
  String toString() {
    return 'SaveDraftRequestDto(userName: $userName, userIdentityNumber: $userIdentityNumber, address: $address, userIdentityNumberFile: $userIdentityNumberFile, cowId: $cowId, cowQuantity: $cowQuantity, cowTotalPrice: $cowTotalPrice, bankAccountId: $bankAccountId, program: $program, contractMonthDuration: $contractMonthDuration, deleteUserIdentityNumberFile: $deleteUserIdentityNumberFile)';
  }
}

/// @nodoc
abstract mixin class _$SaveDraftRequestDtoCopyWith<$Res>
    implements $SaveDraftRequestDtoCopyWith<$Res> {
  factory _$SaveDraftRequestDtoCopyWith(_SaveDraftRequestDto value,
          $Res Function(_SaveDraftRequestDto) _then) =
      __$SaveDraftRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? userName,
      String? userIdentityNumber,
      String? address,
      @JsonKey(includeFromJson: false, includeToJson: false)
      File? userIdentityNumberFile,
      int? cowId,
      int? cowQuantity,
      double? cowTotalPrice,
      int? bankAccountId,
      String? program,
      int? contractMonthDuration,
      bool? deleteUserIdentityNumberFile});
}

/// @nodoc
class __$SaveDraftRequestDtoCopyWithImpl<$Res>
    implements _$SaveDraftRequestDtoCopyWith<$Res> {
  __$SaveDraftRequestDtoCopyWithImpl(this._self, this._then);

  final _SaveDraftRequestDto _self;
  final $Res Function(_SaveDraftRequestDto) _then;

  /// Create a copy of SaveDraftRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = freezed,
    Object? userIdentityNumber = freezed,
    Object? address = freezed,
    Object? userIdentityNumberFile = freezed,
    Object? cowId = freezed,
    Object? cowQuantity = freezed,
    Object? cowTotalPrice = freezed,
    Object? bankAccountId = freezed,
    Object? program = freezed,
    Object? contractMonthDuration = freezed,
    Object? deleteUserIdentityNumberFile = freezed,
  }) {
    return _then(_SaveDraftRequestDto(
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumber: freezed == userIdentityNumber
          ? _self.userIdentityNumber
          : userIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentityNumberFile: freezed == userIdentityNumberFile
          ? _self.userIdentityNumberFile
          : userIdentityNumberFile // ignore: cast_nullable_to_non_nullable
              as File?,
      cowId: freezed == cowId
          ? _self.cowId
          : cowId // ignore: cast_nullable_to_non_nullable
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
      program: freezed == program
          ? _self.program
          : program // ignore: cast_nullable_to_non_nullable
              as String?,
      contractMonthDuration: freezed == contractMonthDuration
          ? _self.contractMonthDuration
          : contractMonthDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteUserIdentityNumberFile: freezed == deleteUserIdentityNumberFile
          ? _self.deleteUserIdentityNumberFile
          : deleteUserIdentityNumberFile // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
