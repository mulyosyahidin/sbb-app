// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bank_account_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBankAccountRequestDto {
  String get bankName;
  String get accountName;
  String get accountNumber;
  String? get note;
  bool get isPrimary;

  /// Create a copy of UpdateBankAccountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateBankAccountRequestDtoCopyWith<UpdateBankAccountRequestDto>
      get copyWith => _$UpdateBankAccountRequestDtoCopyWithImpl<
              UpdateBankAccountRequestDto>(
          this as UpdateBankAccountRequestDto, _$identity);

  /// Serializes this UpdateBankAccountRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateBankAccountRequestDto &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, bankName, accountName, accountNumber, note, isPrimary);

  @override
  String toString() {
    return 'UpdateBankAccountRequestDto(bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber, note: $note, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class $UpdateBankAccountRequestDtoCopyWith<$Res> {
  factory $UpdateBankAccountRequestDtoCopyWith(
          UpdateBankAccountRequestDto value,
          $Res Function(UpdateBankAccountRequestDto) _then) =
      _$UpdateBankAccountRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String bankName,
      String accountName,
      String accountNumber,
      String? note,
      bool isPrimary});
}

/// @nodoc
class _$UpdateBankAccountRequestDtoCopyWithImpl<$Res>
    implements $UpdateBankAccountRequestDtoCopyWith<$Res> {
  _$UpdateBankAccountRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateBankAccountRequestDto _self;
  final $Res Function(UpdateBankAccountRequestDto) _then;

  /// Create a copy of UpdateBankAccountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? note = freezed,
    Object? isPrimary = null,
  }) {
    return _then(_self.copyWith(
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateBankAccountRequestDto implements UpdateBankAccountRequestDto {
  const _UpdateBankAccountRequestDto(
      {required this.bankName,
      required this.accountName,
      required this.accountNumber,
      this.note,
      this.isPrimary = false});
  factory _UpdateBankAccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBankAccountRequestDtoFromJson(json);

  @override
  final String bankName;
  @override
  final String accountName;
  @override
  final String accountNumber;
  @override
  final String? note;
  @override
  @JsonKey()
  final bool isPrimary;

  /// Create a copy of UpdateBankAccountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateBankAccountRequestDtoCopyWith<_UpdateBankAccountRequestDto>
      get copyWith => __$UpdateBankAccountRequestDtoCopyWithImpl<
          _UpdateBankAccountRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateBankAccountRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateBankAccountRequestDto &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, bankName, accountName, accountNumber, note, isPrimary);

  @override
  String toString() {
    return 'UpdateBankAccountRequestDto(bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber, note: $note, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class _$UpdateBankAccountRequestDtoCopyWith<$Res>
    implements $UpdateBankAccountRequestDtoCopyWith<$Res> {
  factory _$UpdateBankAccountRequestDtoCopyWith(
          _UpdateBankAccountRequestDto value,
          $Res Function(_UpdateBankAccountRequestDto) _then) =
      __$UpdateBankAccountRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String bankName,
      String accountName,
      String accountNumber,
      String? note,
      bool isPrimary});
}

/// @nodoc
class __$UpdateBankAccountRequestDtoCopyWithImpl<$Res>
    implements _$UpdateBankAccountRequestDtoCopyWith<$Res> {
  __$UpdateBankAccountRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateBankAccountRequestDto _self;
  final $Res Function(_UpdateBankAccountRequestDto) _then;

  /// Create a copy of UpdateBankAccountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bankName = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? note = freezed,
    Object? isPrimary = null,
  }) {
    return _then(_UpdateBankAccountRequestDto(
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
