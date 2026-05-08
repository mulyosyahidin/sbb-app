// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankAccountDto {
  String get id;
  String get userId;
  bool get isPrimary;
  String get accountName;
  String get accountNumber;
  String get bankName;
  String? get note;
  String get createdAt;
  String get updatedAt;

  /// Create a copy of BankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankAccountDtoCopyWith<BankAccountDto> get copyWith =>
      _$BankAccountDtoCopyWithImpl<BankAccountDto>(
          this as BankAccountDto, _$identity);

  /// Serializes this BankAccountDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankAccountDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, isPrimary,
      accountName, accountNumber, bankName, note, createdAt, updatedAt);

  @override
  String toString() {
    return 'BankAccountDto(id: $id, userId: $userId, isPrimary: $isPrimary, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $BankAccountDtoCopyWith<$Res> {
  factory $BankAccountDtoCopyWith(
          BankAccountDto value, $Res Function(BankAccountDto) _then) =
      _$BankAccountDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      bool isPrimary,
      String accountName,
      String accountNumber,
      String bankName,
      String? note,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$BankAccountDtoCopyWithImpl<$Res>
    implements $BankAccountDtoCopyWith<$Res> {
  _$BankAccountDtoCopyWithImpl(this._self, this._then);

  final BankAccountDto _self;
  final $Res Function(BankAccountDto) _then;

  /// Create a copy of BankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isPrimary = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? bankName = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BankAccountDto implements BankAccountDto {
  const _BankAccountDto(
      {required this.id,
      required this.userId,
      required this.isPrimary,
      required this.accountName,
      required this.accountNumber,
      required this.bankName,
      this.note,
      required this.createdAt,
      required this.updatedAt});
  factory _BankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDtoFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final bool isPrimary;
  @override
  final String accountName;
  @override
  final String accountNumber;
  @override
  final String bankName;
  @override
  final String? note;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  /// Create a copy of BankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankAccountDtoCopyWith<_BankAccountDto> get copyWith =>
      __$BankAccountDtoCopyWithImpl<_BankAccountDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankAccountDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankAccountDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, isPrimary,
      accountName, accountNumber, bankName, note, createdAt, updatedAt);

  @override
  String toString() {
    return 'BankAccountDto(id: $id, userId: $userId, isPrimary: $isPrimary, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$BankAccountDtoCopyWith<$Res>
    implements $BankAccountDtoCopyWith<$Res> {
  factory _$BankAccountDtoCopyWith(
          _BankAccountDto value, $Res Function(_BankAccountDto) _then) =
      __$BankAccountDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      bool isPrimary,
      String accountName,
      String accountNumber,
      String bankName,
      String? note,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$BankAccountDtoCopyWithImpl<$Res>
    implements _$BankAccountDtoCopyWith<$Res> {
  __$BankAccountDtoCopyWithImpl(this._self, this._then);

  final _BankAccountDto _self;
  final $Res Function(_BankAccountDto) _then;

  /// Create a copy of BankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isPrimary = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? bankName = null,
    Object? note = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_BankAccountDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
