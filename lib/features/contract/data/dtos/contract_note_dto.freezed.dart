// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractNoteDto {
  @IntStringConverter()
  int get id;
  @IntStringConverter()
  int get userId;
  @IntStringConverter()
  int get contractId;
  String get note;
  Map<String, dynamic>? get dataAfter;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ContractNoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractNoteDtoCopyWith<ContractNoteDto> get copyWith =>
      _$ContractNoteDtoCopyWithImpl<ContractNoteDto>(
          this as ContractNoteDto, _$identity);

  /// Serializes this ContractNoteDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractNoteDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other.dataAfter, dataAfter) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, contractId, note,
      const DeepCollectionEquality().hash(dataAfter), createdAt, updatedAt);

  @override
  String toString() {
    return 'ContractNoteDto(id: $id, userId: $userId, contractId: $contractId, note: $note, dataAfter: $dataAfter, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ContractNoteDtoCopyWith<$Res> {
  factory $ContractNoteDtoCopyWith(
          ContractNoteDto value, $Res Function(ContractNoteDto) _then) =
      _$ContractNoteDtoCopyWithImpl;
  @useResult
  $Res call(
      {@IntStringConverter() int id,
      @IntStringConverter() int userId,
      @IntStringConverter() int contractId,
      String note,
      Map<String, dynamic>? dataAfter,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ContractNoteDtoCopyWithImpl<$Res>
    implements $ContractNoteDtoCopyWith<$Res> {
  _$ContractNoteDtoCopyWithImpl(this._self, this._then);

  final ContractNoteDto _self;
  final $Res Function(ContractNoteDto) _then;

  /// Create a copy of ContractNoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? contractId = null,
    Object? note = null,
    Object? dataAfter = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      contractId: null == contractId
          ? _self.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dataAfter: freezed == dataAfter
          ? _self.dataAfter
          : dataAfter // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
}

/// @nodoc
@JsonSerializable()
class _ContractNoteDto implements ContractNoteDto {
  const _ContractNoteDto(
      {@IntStringConverter() required this.id,
      @IntStringConverter() required this.userId,
      @IntStringConverter() required this.contractId,
      required this.note,
      final Map<String, dynamic>? dataAfter,
      required this.createdAt,
      required this.updatedAt})
      : _dataAfter = dataAfter;
  factory _ContractNoteDto.fromJson(Map<String, dynamic> json) =>
      _$ContractNoteDtoFromJson(json);

  @override
  @IntStringConverter()
  final int id;
  @override
  @IntStringConverter()
  final int userId;
  @override
  @IntStringConverter()
  final int contractId;
  @override
  final String note;
  final Map<String, dynamic>? _dataAfter;
  @override
  Map<String, dynamic>? get dataAfter {
    final value = _dataAfter;
    if (value == null) return null;
    if (_dataAfter is EqualUnmodifiableMapView) return _dataAfter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of ContractNoteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractNoteDtoCopyWith<_ContractNoteDto> get copyWith =>
      __$ContractNoteDtoCopyWithImpl<_ContractNoteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContractNoteDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractNoteDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._dataAfter, _dataAfter) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, contractId, note,
      const DeepCollectionEquality().hash(_dataAfter), createdAt, updatedAt);

  @override
  String toString() {
    return 'ContractNoteDto(id: $id, userId: $userId, contractId: $contractId, note: $note, dataAfter: $dataAfter, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ContractNoteDtoCopyWith<$Res>
    implements $ContractNoteDtoCopyWith<$Res> {
  factory _$ContractNoteDtoCopyWith(
          _ContractNoteDto value, $Res Function(_ContractNoteDto) _then) =
      __$ContractNoteDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@IntStringConverter() int id,
      @IntStringConverter() int userId,
      @IntStringConverter() int contractId,
      String note,
      Map<String, dynamic>? dataAfter,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$ContractNoteDtoCopyWithImpl<$Res>
    implements _$ContractNoteDtoCopyWith<$Res> {
  __$ContractNoteDtoCopyWithImpl(this._self, this._then);

  final _ContractNoteDto _self;
  final $Res Function(_ContractNoteDto) _then;

  /// Create a copy of ContractNoteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? contractId = null,
    Object? note = null,
    Object? dataAfter = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ContractNoteDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      contractId: null == contractId
          ? _self.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dataAfter: freezed == dataAfter
          ? _self._dataAfter
          : dataAfter // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
}

// dart format on
