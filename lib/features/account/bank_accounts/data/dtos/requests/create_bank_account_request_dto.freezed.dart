// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_bank_account_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBankAccountRequestDto {
  String get bankName;
  String get accountName;
  String get accountNumber;
  String? get note;
  bool get isPrimary;

  /// Create a copy of CreateBankAccountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateBankAccountRequestDtoCopyWith<CreateBankAccountRequestDto>
      get copyWith => _$CreateBankAccountRequestDtoCopyWithImpl<
              CreateBankAccountRequestDto>(
          this as CreateBankAccountRequestDto, _$identity);

  /// Serializes this CreateBankAccountRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateBankAccountRequestDto &&
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
    return 'CreateBankAccountRequestDto(bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber, note: $note, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class $CreateBankAccountRequestDtoCopyWith<$Res> {
  factory $CreateBankAccountRequestDtoCopyWith(
          CreateBankAccountRequestDto value,
          $Res Function(CreateBankAccountRequestDto) _then) =
      _$CreateBankAccountRequestDtoCopyWithImpl;
  @useResult
  $Res call(
      {String bankName,
      String accountName,
      String accountNumber,
      String? note,
      bool isPrimary});
}

/// @nodoc
class _$CreateBankAccountRequestDtoCopyWithImpl<$Res>
    implements $CreateBankAccountRequestDtoCopyWith<$Res> {
  _$CreateBankAccountRequestDtoCopyWithImpl(this._self, this._then);

  final CreateBankAccountRequestDto _self;
  final $Res Function(CreateBankAccountRequestDto) _then;

  /// Create a copy of CreateBankAccountRequestDto
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
class _CreateBankAccountRequestDto implements CreateBankAccountRequestDto {
  const _CreateBankAccountRequestDto(
      {required this.bankName,
      required this.accountName,
      required this.accountNumber,
      this.note,
      this.isPrimary = false});
  factory _CreateBankAccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBankAccountRequestDtoFromJson(json);

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

  /// Create a copy of CreateBankAccountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateBankAccountRequestDtoCopyWith<_CreateBankAccountRequestDto>
      get copyWith => __$CreateBankAccountRequestDtoCopyWithImpl<
          _CreateBankAccountRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateBankAccountRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateBankAccountRequestDto &&
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
    return 'CreateBankAccountRequestDto(bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber, note: $note, isPrimary: $isPrimary)';
  }
}

/// @nodoc
abstract mixin class _$CreateBankAccountRequestDtoCopyWith<$Res>
    implements $CreateBankAccountRequestDtoCopyWith<$Res> {
  factory _$CreateBankAccountRequestDtoCopyWith(
          _CreateBankAccountRequestDto value,
          $Res Function(_CreateBankAccountRequestDto) _then) =
      __$CreateBankAccountRequestDtoCopyWithImpl;
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
class __$CreateBankAccountRequestDtoCopyWithImpl<$Res>
    implements _$CreateBankAccountRequestDtoCopyWith<$Res> {
  __$CreateBankAccountRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateBankAccountRequestDto _self;
  final $Res Function(_CreateBankAccountRequestDto) _then;

  /// Create a copy of CreateBankAccountRequestDto
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
    return _then(_CreateBankAccountRequestDto(
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
