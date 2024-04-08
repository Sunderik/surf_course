// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      json['id'] as String,
      UrlsDto.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
      'id': instance.id,
      'urls': instance.urls,
    };
