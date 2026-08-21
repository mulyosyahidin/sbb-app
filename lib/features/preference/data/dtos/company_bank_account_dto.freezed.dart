// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_bank_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyBankAccountDto {
  String get name;
  String get accountNumber;
  String get accountName;

  /// Create a copy of CompanyBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompanyBankAccountDtoCopyWith<CompanyBankAccountDto> get copyWith =>
      _$CompanyBankAccountDtoCopyWithImpl<CompanyBankAccountDto>(
          this as CompanyBankAccountDto, _$identity);

  /// Serializes this CompanyBankAccountDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyBankAccountDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, accountNumber, accountName);

  @override
  String toString() {
    return 'CompanyBankAccountDto(name: $name, accountNumber: $accountNumber, accountName: $accountName)';
  }
}

/// @nodoc
abstract mixin class $CompanyBankAccountDtoCopyWith<$Res> {
  factory $CompanyBankAccountDtoCopyWith(CompanyBankAccountDto value,
          $Res Function(CompanyBankAccountDto) _then) =
      _$CompanyBankAccountDtoCopyWithImpl;
  @useResult
  $Res call({String name, String accountNumber, String accountName});
}

/// @nodoc
class _$CompanyBankAccountDtoCopyWithImpl<$Res>
    implements $CompanyBankAccountDtoCopyWith<$Res> {
  _$CompanyBankAccountDtoCopyWithImpl(this._self, this._then);

  final CompanyBankAccountDto _self;
  final $Res Function(CompanyBankAccountDto) _then;

  /// Create a copy of CompanyBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accountNumber = null,
    Object? accountName = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CompanyBankAccountDto implements CompanyBankAccountDto {
  const _CompanyBankAccountDto(
      {required this.name,
      required this.accountNumber,
      required this.accountName});
  factory _CompanyBankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyBankAccountDtoFromJson(json);

  @override
  final String name;
  @override
  final String accountNumber;
  @override
  final String accountName;

  /// Create a copy of CompanyBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompanyBankAccountDtoCopyWith<_CompanyBankAccountDto> get copyWith =>
      __$CompanyBankAccountDtoCopyWithImpl<_CompanyBankAccountDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyBankAccountDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyBankAccountDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, accountNumber, accountName);

  @override
  String toString() {
    return 'CompanyBankAccountDto(name: $name, accountNumber: $accountNumber, accountName: $accountName)';
  }
}

/// @nodoc
abstract mixin class _$CompanyBankAccountDtoCopyWith<$Res>
    implements $CompanyBankAccountDtoCopyWith<$Res> {
  factory _$CompanyBankAccountDtoCopyWith(_CompanyBankAccountDto value,
          $Res Function(_CompanyBankAccountDto) _then) =
      __$CompanyBankAccountDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String accountNumber, String accountName});
}

/// @nodoc
class __$CompanyBankAccountDtoCopyWithImpl<$Res>
    implements _$CompanyBankAccountDtoCopyWith<$Res> {
  __$CompanyBankAccountDtoCopyWithImpl(this._self, this._then);

  final _CompanyBankAccountDto _self;
  final $Res Function(_CompanyBankAccountDto) _then;

  /// Create a copy of CompanyBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? accountNumber = null,
    Object? accountName = null,
  }) {
    return _then(_CompanyBankAccountDto(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
