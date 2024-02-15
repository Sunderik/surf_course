// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsDto _$ColorsDtoFromJson(Map<String, dynamic> json) => ColorsDto(
      (json['colors'] as List<dynamic>)
          .map((e) => ColorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ColorsDtoToJson(ColorsDto instance) => <String, dynamic>{
      'colors': instance.colors,
    };
