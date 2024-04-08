import 'package:json_annotation/json_annotation.dart';
import 'package:task_280410/core/network/models/dtos/urls_dto.dart';

part 'image_dto.g.dart';

/// Модель переноса данных для объекта изображения
@JsonSerializable()
class ImageDto {
  /// Идентификатор изображения
  String id;

  /// Объект ссылок для получения изображения
  UrlsDto urls;

  ImageDto(this.id, this.urls);

  /// Получить модель из json
  factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);

  /// Конвертировать модель в json
  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
