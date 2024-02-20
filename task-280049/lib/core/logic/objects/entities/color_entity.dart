import 'package:flutter/material.dart';

/// Модель сущности цвета
class ColorEntity {
  /// Наименование цвета
  final String name;

  /// Значение цвета
  final String value;

  /// Сущности цвета
  ColorEntity(this.name, this.value);

  /// Пустая сущности цвета
  ColorEntity.empty()
      : name = '',
        value = '';

  /// Получить объект [Color] из сущности цвета, на основе ее значения [value],и если он пуст
  /// получить прозрачный цвет.
  Color getColor() {
    if (value.isNotEmpty) {
      return Color(int.parse('0xff${value.substring(1)}'));
    } else {
      return Colors.transparent;
    }
  }
}
