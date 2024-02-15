import 'package:task_280049/core/logic/objects/dtos/color_dto.dart';

class ColorEntity {
  final String name;
  final String? value;

  ColorEntity(this.name, this.value);

  ColorEntity.fromDto(ColorDto dto)
      : name = dto.name,
        value = dto.value;

  ColorDto toDto() => ColorDto(name, value);
}
