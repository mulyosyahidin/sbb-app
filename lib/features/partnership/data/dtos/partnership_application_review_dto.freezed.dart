// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partnership_application_review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnershipReviewerDto {
  @JsonKey(fromJson: _intFromJson)
  int get id;
  @JsonKey(fromJson: _stringFromJson)
  String get name;

  /// Create a copy of PartnershipReviewerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnershipReviewerDtoCopyWith<PartnershipReviewerDto> get copyWith =>
      _$PartnershipReviewerDtoCopyWithImpl<PartnershipReviewerDto>(
          this as PartnershipReviewerDto, _$identity);

  /// Serializes this PartnershipReviewerDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnershipReviewerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'PartnershipReviewerDto(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $PartnershipReviewerDtoCopyWith<$Res> {
  factory $PartnershipReviewerDtoCopyWith(PartnershipReviewerDto value,
          $Res Function(PartnershipReviewerDto) _then) =
      _$PartnershipReviewerDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _stringFromJson) String name});
}

/// @nodoc
class _$PartnershipReviewerDtoCopyWithImpl<$Res>
    implements $PartnershipReviewerDtoCopyWith<$Res> {
  _$PartnershipReviewerDtoCopyWithImpl(this._self, this._then);

  final PartnershipReviewerDto _self;
  final $Res Function(PartnershipReviewerDto) _then;

  /// Create a copy of PartnershipReviewerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PartnershipReviewerDto implements PartnershipReviewerDto {
  const _PartnershipReviewerDto(
      {@JsonKey(fromJson: _intFromJson) required this.id,
      @JsonKey(fromJson: _stringFromJson) required this.name});
  factory _PartnershipReviewerDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipReviewerDtoFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String name;

  /// Create a copy of PartnershipReviewerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartnershipReviewerDtoCopyWith<_PartnershipReviewerDto> get copyWith =>
      __$PartnershipReviewerDtoCopyWithImpl<_PartnershipReviewerDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartnershipReviewerDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartnershipReviewerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'PartnershipReviewerDto(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$PartnershipReviewerDtoCopyWith<$Res>
    implements $PartnershipReviewerDtoCopyWith<$Res> {
  factory _$PartnershipReviewerDtoCopyWith(_PartnershipReviewerDto value,
          $Res Function(_PartnershipReviewerDto) _then) =
      __$PartnershipReviewerDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _stringFromJson) String name});
}

/// @nodoc
class __$PartnershipReviewerDtoCopyWithImpl<$Res>
    implements _$PartnershipReviewerDtoCopyWith<$Res> {
  __$PartnershipReviewerDtoCopyWithImpl(this._self, this._then);

  final _PartnershipReviewerDto _self;
  final $Res Function(_PartnershipReviewerDto) _then;

  /// Create a copy of PartnershipReviewerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_PartnershipReviewerDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PartnershipApplicationReviewDto {
  @JsonKey(fromJson: _intFromJson)
  int get id;
  @JsonKey(fromJson: _stringFromJson)
  String get status;
  @JsonKey(fromJson: _stringFromJson)
  String get statusLabel;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get note;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get dataSnapshot;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get reviewedAt;
  PartnershipReviewerDto? get reviewedBy;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get createdAt;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get updatedAt;

  /// Create a copy of PartnershipApplicationReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnershipApplicationReviewDtoCopyWith<PartnershipApplicationReviewDto>
      get copyWith => _$PartnershipApplicationReviewDtoCopyWithImpl<
              PartnershipApplicationReviewDto>(
          this as PartnershipApplicationReviewDto, _$identity);

  /// Serializes this PartnershipApplicationReviewDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnershipApplicationReviewDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.dataSnapshot, dataSnapshot) ||
                other.dataSnapshot == dataSnapshot) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, statusLabel, note,
      dataSnapshot, reviewedAt, reviewedBy, createdAt, updatedAt);

  @override
  String toString() {
    return 'PartnershipApplicationReviewDto(id: $id, status: $status, statusLabel: $statusLabel, note: $note, dataSnapshot: $dataSnapshot, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PartnershipApplicationReviewDtoCopyWith<$Res> {
  factory $PartnershipApplicationReviewDtoCopyWith(
          PartnershipApplicationReviewDto value,
          $Res Function(PartnershipApplicationReviewDto) _then) =
      _$PartnershipApplicationReviewDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _stringFromJson) String status,
      @JsonKey(fromJson: _stringFromJson) String statusLabel,
      @JsonKey(fromJson: _nullableStringFromJson) String? note,
      @JsonKey(fromJson: _nullableStringFromJson) String? dataSnapshot,
      @JsonKey(fromJson: _nullableStringFromJson) String? reviewedAt,
      PartnershipReviewerDto? reviewedBy,
      @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt});

  $PartnershipReviewerDtoCopyWith<$Res>? get reviewedBy;
}

/// @nodoc
class _$PartnershipApplicationReviewDtoCopyWithImpl<$Res>
    implements $PartnershipApplicationReviewDtoCopyWith<$Res> {
  _$PartnershipApplicationReviewDtoCopyWithImpl(this._self, this._then);

  final PartnershipApplicationReviewDto _self;
  final $Res Function(PartnershipApplicationReviewDto) _then;

  /// Create a copy of PartnershipApplicationReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? note = freezed,
    Object? dataSnapshot = freezed,
    Object? reviewedAt = freezed,
    Object? reviewedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _self.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSnapshot: freezed == dataSnapshot
          ? _self.dataSnapshot
          : dataSnapshot // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedAt: freezed == reviewedAt
          ? _self.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedBy: freezed == reviewedBy
          ? _self.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as PartnershipReviewerDto?,
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

  /// Create a copy of PartnershipApplicationReviewDto
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
class _PartnershipApplicationReviewDto
    implements PartnershipApplicationReviewDto {
  const _PartnershipApplicationReviewDto(
      {@JsonKey(fromJson: _intFromJson) required this.id,
      @JsonKey(fromJson: _stringFromJson) required this.status,
      @JsonKey(fromJson: _stringFromJson) required this.statusLabel,
      @JsonKey(fromJson: _nullableStringFromJson) this.note,
      @JsonKey(fromJson: _nullableStringFromJson) this.dataSnapshot,
      @JsonKey(fromJson: _nullableStringFromJson) this.reviewedAt,
      this.reviewedBy,
      @JsonKey(fromJson: _nullableStringFromJson) this.createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) this.updatedAt});
  factory _PartnershipApplicationReviewDto.fromJson(
          Map<String, dynamic> json) =>
      _$PartnershipApplicationReviewDtoFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String status;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String statusLabel;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? note;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? dataSnapshot;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? reviewedAt;
  @override
  final PartnershipReviewerDto? reviewedBy;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? createdAt;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? updatedAt;

  /// Create a copy of PartnershipApplicationReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartnershipApplicationReviewDtoCopyWith<_PartnershipApplicationReviewDto>
      get copyWith => __$PartnershipApplicationReviewDtoCopyWithImpl<
          _PartnershipApplicationReviewDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartnershipApplicationReviewDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartnershipApplicationReviewDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.dataSnapshot, dataSnapshot) ||
                other.dataSnapshot == dataSnapshot) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, statusLabel, note,
      dataSnapshot, reviewedAt, reviewedBy, createdAt, updatedAt);

  @override
  String toString() {
    return 'PartnershipApplicationReviewDto(id: $id, status: $status, statusLabel: $statusLabel, note: $note, dataSnapshot: $dataSnapshot, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PartnershipApplicationReviewDtoCopyWith<$Res>
    implements $PartnershipApplicationReviewDtoCopyWith<$Res> {
  factory _$PartnershipApplicationReviewDtoCopyWith(
          _PartnershipApplicationReviewDto value,
          $Res Function(_PartnershipApplicationReviewDto) _then) =
      __$PartnershipApplicationReviewDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _stringFromJson) String status,
      @JsonKey(fromJson: _stringFromJson) String statusLabel,
      @JsonKey(fromJson: _nullableStringFromJson) String? note,
      @JsonKey(fromJson: _nullableStringFromJson) String? dataSnapshot,
      @JsonKey(fromJson: _nullableStringFromJson) String? reviewedAt,
      PartnershipReviewerDto? reviewedBy,
      @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt});

  @override
  $PartnershipReviewerDtoCopyWith<$Res>? get reviewedBy;
}

/// @nodoc
class __$PartnershipApplicationReviewDtoCopyWithImpl<$Res>
    implements _$PartnershipApplicationReviewDtoCopyWith<$Res> {
  __$PartnershipApplicationReviewDtoCopyWithImpl(this._self, this._then);

  final _PartnershipApplicationReviewDto _self;
  final $Res Function(_PartnershipApplicationReviewDto) _then;

  /// Create a copy of PartnershipApplicationReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? note = freezed,
    Object? dataSnapshot = freezed,
    Object? reviewedAt = freezed,
    Object? reviewedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_PartnershipApplicationReviewDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _self.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      dataSnapshot: freezed == dataSnapshot
          ? _self.dataSnapshot
          : dataSnapshot // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedAt: freezed == reviewedAt
          ? _self.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedBy: freezed == reviewedBy
          ? _self.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as PartnershipReviewerDto?,
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

  /// Create a copy of PartnershipApplicationReviewDto
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
