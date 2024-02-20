import 'package:json_annotation/json_annotation.dart';

part 'color_dto.g.dart';

/// Модель объекта передачи данных цвета
@JsonSerializable()
class ColorDto {
  /// Название цвета
  final String name;

  /// Значение цвета в формате HEX
  final String? value;

  /// Объект передачи данных цвета
  ColorDto(this.name, this.value);

  /// Получить объект передачи данных цвета из json
  factory ColorDto.fromJson(Map<String, dynamic> json) => _$ColorDtoFromJson(json);

  /// Конвертировать объект передачи данных цвета в json
  Map<String, dynamic> toJson() => _$ColorDtoToJson(this);
}
