import 'package:json_annotation/json_annotation.dart';

part 'urls_dto.g.dart';

/// Модель объекта ссылок для получения изображения
@JsonSerializable()
class UrlsDto {
  /// Ссылка на исходное изображение
  String raw;

  ///  Ссылка на изображение в полном качестве
  String full;

  ///  Ссылка на изображение в оптимизированном качестве
  String regular;

  UrlsDto(this.raw, this.full, this.regular);

  factory UrlsDto.fromJson(Map<String, dynamic> json) => _$UrlsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsDtoToJson(this);
}
