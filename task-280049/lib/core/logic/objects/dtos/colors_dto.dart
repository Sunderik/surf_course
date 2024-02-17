import 'package:json_annotation/json_annotation.dart';
import 'package:task_280049/core/logic/objects/dtos/color_dto.dart';

part 'colors_dto.g.dart';

/// Модель объекта передачи данных списка цветов
@JsonSerializable()
class ColorsDto {
  /// Список объектов передачи данных цветов
  final List<ColorDto> colors;

  /// Объект передачи данных списка цветов
  ColorsDto(this.colors);

  /// Получить объект передачи данных списка цветов
  factory ColorsDto.fromJson(Map<String, dynamic> json) => _$ColorsDtoFromJson(json);

  /// Конвертировать объект передачи данных списка цветов в json
  Map<String, dynamic> toJson() => _$ColorsDtoToJson(this);
}
