// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partnership_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnershipDto {
  @JsonKey(fromJson: _intFromJson)
  int get id;
  @JsonKey(fromJson: _intFromJson)
  int get userId;
  @JsonKey(fromJson: _intFromJson)
  int get level;
  @JsonKey(fromJson: _stringFromJson)
  String get levelLabel;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get refferalCode;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get approvedAt;
  PartnershipReviewerDto? get approvedBy;
  PartnershipApplicationDto? get latestApplication;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get createdAt;
  @JsonKey(fromJson: _nullableStringFromJson)
  String? get updatedAt;

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnershipDtoCopyWith<PartnershipDto> get copyWith =>
      _$PartnershipDtoCopyWithImpl<PartnershipDto>(
          this as PartnershipDto, _$identity);

  /// Serializes this PartnershipDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnershipDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.levelLabel, levelLabel) ||
                other.levelLabel == levelLabel) &&
            (identical(other.refferalCode, refferalCode) ||
                other.refferalCode == refferalCode) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.latestApplication, latestApplication) ||
                other.latestApplication == latestApplication) &&
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
      userId,
      level,
      levelLabel,
      refferalCode,
      approvedAt,
      approvedBy,
      latestApplication,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'PartnershipDto(id: $id, userId: $userId, level: $level, levelLabel: $levelLabel, refferalCode: $refferalCode, approvedAt: $approvedAt, approvedBy: $approvedBy, latestApplication: $latestApplication, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $PartnershipDtoCopyWith<$Res> {
  factory $PartnershipDtoCopyWith(
          PartnershipDto value, $Res Function(PartnershipDto) _then) =
      _$PartnershipDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _intFromJson) int userId,
      @JsonKey(fromJson: _intFromJson) int level,
      @JsonKey(fromJson: _stringFromJson) String levelLabel,
      @JsonKey(fromJson: _nullableStringFromJson) String? refferalCode,
      @JsonKey(fromJson: _nullableStringFromJson) String? approvedAt,
      PartnershipReviewerDto? approvedBy,
      PartnershipApplicationDto? latestApplication,
      @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt});

  $PartnershipReviewerDtoCopyWith<$Res>? get approvedBy;
  $PartnershipApplicationDtoCopyWith<$Res>? get latestApplication;
}

/// @nodoc
class _$PartnershipDtoCopyWithImpl<$Res>
    implements $PartnershipDtoCopyWith<$Res> {
  _$PartnershipDtoCopyWithImpl(this._self, this._then);

  final PartnershipDto _self;
  final $Res Function(PartnershipDto) _then;

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? level = null,
    Object? levelLabel = null,
    Object? refferalCode = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
    Object? latestApplication = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      levelLabel: null == levelLabel
          ? _self.levelLabel
          : levelLabel // ignore: cast_nullable_to_non_nullable
              as String,
      refferalCode: freezed == refferalCode
          ? _self.refferalCode
          : refferalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _self.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedBy: freezed == approvedBy
          ? _self.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as PartnershipReviewerDto?,
      latestApplication: freezed == latestApplication
          ? _self.latestApplication
          : latestApplication // ignore: cast_nullable_to_non_nullable
              as PartnershipApplicationDto?,
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

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipReviewerDtoCopyWith<$Res>? get approvedBy {
    if (_self.approvedBy == null) {
      return null;
    }

    return $PartnershipReviewerDtoCopyWith<$Res>(_self.approvedBy!, (value) {
      return _then(_self.copyWith(approvedBy: value));
    });
  }

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipApplicationDtoCopyWith<$Res>? get latestApplication {
    if (_self.latestApplication == null) {
      return null;
    }

    return $PartnershipApplicationDtoCopyWith<$Res>(_self.latestApplication!,
        (value) {
      return _then(_self.copyWith(latestApplication: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PartnershipDto implements PartnershipDto {
  const _PartnershipDto(
      {@JsonKey(fromJson: _intFromJson) required this.id,
      @JsonKey(fromJson: _intFromJson) required this.userId,
      @JsonKey(fromJson: _intFromJson) required this.level,
      @JsonKey(fromJson: _stringFromJson) required this.levelLabel,
      @JsonKey(fromJson: _nullableStringFromJson) this.refferalCode,
      @JsonKey(fromJson: _nullableStringFromJson) this.approvedAt,
      this.approvedBy,
      this.latestApplication,
      @JsonKey(fromJson: _nullableStringFromJson) this.createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) this.updatedAt});
  factory _PartnershipDto.fromJson(Map<String, dynamic> json) =>
      _$PartnershipDtoFromJson(json);

  @override
  @JsonKey(fromJson: _intFromJson)
  final int id;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int userId;
  @override
  @JsonKey(fromJson: _intFromJson)
  final int level;
  @override
  @JsonKey(fromJson: _stringFromJson)
  final String levelLabel;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? refferalCode;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? approvedAt;
  @override
  final PartnershipReviewerDto? approvedBy;
  @override
  final PartnershipApplicationDto? latestApplication;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? createdAt;
  @override
  @JsonKey(fromJson: _nullableStringFromJson)
  final String? updatedAt;

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PartnershipDtoCopyWith<_PartnershipDto> get copyWith =>
      __$PartnershipDtoCopyWithImpl<_PartnershipDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PartnershipDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartnershipDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.levelLabel, levelLabel) ||
                other.levelLabel == levelLabel) &&
            (identical(other.refferalCode, refferalCode) ||
                other.refferalCode == refferalCode) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.latestApplication, latestApplication) ||
                other.latestApplication == latestApplication) &&
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
      userId,
      level,
      levelLabel,
      refferalCode,
      approvedAt,
      approvedBy,
      latestApplication,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'PartnershipDto(id: $id, userId: $userId, level: $level, levelLabel: $levelLabel, refferalCode: $refferalCode, approvedAt: $approvedAt, approvedBy: $approvedBy, latestApplication: $latestApplication, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$PartnershipDtoCopyWith<$Res>
    implements $PartnershipDtoCopyWith<$Res> {
  factory _$PartnershipDtoCopyWith(
          _PartnershipDto value, $Res Function(_PartnershipDto) _then) =
      __$PartnershipDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _intFromJson) int id,
      @JsonKey(fromJson: _intFromJson) int userId,
      @JsonKey(fromJson: _intFromJson) int level,
      @JsonKey(fromJson: _stringFromJson) String levelLabel,
      @JsonKey(fromJson: _nullableStringFromJson) String? refferalCode,
      @JsonKey(fromJson: _nullableStringFromJson) String? approvedAt,
      PartnershipReviewerDto? approvedBy,
      PartnershipApplicationDto? latestApplication,
      @JsonKey(fromJson: _nullableStringFromJson) String? createdAt,
      @JsonKey(fromJson: _nullableStringFromJson) String? updatedAt});

  @override
  $PartnershipReviewerDtoCopyWith<$Res>? get approvedBy;
  @override
  $PartnershipApplicationDtoCopyWith<$Res>? get latestApplication;
}

/// @nodoc
class __$PartnershipDtoCopyWithImpl<$Res>
    implements _$PartnershipDtoCopyWith<$Res> {
  __$PartnershipDtoCopyWithImpl(this._self, this._then);

  final _PartnershipDto _self;
  final $Res Function(_PartnershipDto) _then;

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? level = null,
    Object? levelLabel = null,
    Object? refferalCode = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
    Object? latestApplication = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_PartnershipDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      levelLabel: null == levelLabel
          ? _self.levelLabel
          : levelLabel // ignore: cast_nullable_to_non_nullable
              as String,
      refferalCode: freezed == refferalCode
          ? _self.refferalCode
          : refferalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedAt: freezed == approvedAt
          ? _self.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedBy: freezed == approvedBy
          ? _self.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as PartnershipReviewerDto?,
      latestApplication: freezed == latestApplication
          ? _self.latestApplication
          : latestApplication // ignore: cast_nullable_to_non_nullable
              as PartnershipApplicationDto?,
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

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipReviewerDtoCopyWith<$Res>? get approvedBy {
    if (_self.approvedBy == null) {
      return null;
    }

    return $PartnershipReviewerDtoCopyWith<$Res>(_self.approvedBy!, (value) {
      return _then(_self.copyWith(approvedBy: value));
    });
  }

  /// Create a copy of PartnershipDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnershipApplicationDtoCopyWith<$Res>? get latestApplication {
    if (_self.latestApplication == null) {
      return null;
    }

    return $PartnershipApplicationDtoCopyWith<$Res>(_self.latestApplication!,
        (value) {
      return _then(_self.copyWith(latestApplication: value));
    });
  }
}

// dart format on
