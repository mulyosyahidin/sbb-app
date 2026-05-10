// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cow_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CowDto _$CowDtoFromJson(Map<String, dynamic> json) => _CowDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      weightKg: const DoubleStringConverter().fromJson(json['weight_kg']),
      isAvailable: json['is_available'] as bool,
      currentPrice: json['current_price'] as String,
      featuredImageUrl: json['featured_image_url'] as String,
      metas: (json['metas'] as List<dynamic>?)
          ?.map((e) => CowMetaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => CowImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CowDtoToJson(_CowDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'weight_kg': const DoubleStringConverter().toJson(instance.weightKg),
      'is_available': instance.isAvailable,
      'current_price': instance.currentPrice,
      'featured_image_url': instance.featuredImageUrl,
      'metas': instance.metas,
      'images': instance.images,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
