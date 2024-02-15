import 'package:flutter/material.dart';
import 'package:task_280049/core/logic/objects/dtos/color_dto.dart';

class ColorEntity {
  final String name;
  final String? value;

  ColorEntity(this.name, this.value);

  ColorEntity.fromDto(ColorDto dto)
      : name = dto.name,
        value = dto.value;

  ColorDto toDto() => ColorDto(name, value);

  Color getColor() {
    if (value != null && value!.isNotEmpty) {
      return Color(int.parse('0xff${value!.substring(1)}'));
    } else {
      return Colors.transparent;
    }
  }
}
