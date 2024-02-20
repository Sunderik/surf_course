import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';

/// Основной стейт приложения реализует архитектуру mwwm
@singleton
class ColorsStateModel extends ChangeNotifier {
  /// Экземпляр вариантов использования взаимодействия с цветами
  final ColorsUseCase _colorsUseCases;

  /// Объект основного стейта приложения для работы с цветами
  ColorsStateModel(this._colorsUseCases);

  /// Список используемых цветов
  final List<ColorEntity> _colors = [];

  /// Цвет находящийся в системном буфере обмена
  ColorEntity? _colorInClipboard;

  /// Список используемых цветов (свойство)
  UnmodifiableListView<ColorEntity> get colors => UnmodifiableListView(_colors);

  ///  Цвет находящийся в системном буфере обмена (свойство)
  ColorEntity? get colorInClipboard => _colorInClipboard;

  /// Запрос на получение цветов
  Future<void> fetchColors() async {
    final colors = await _colorsUseCases.fetchColors();
    _setColors(colors);
  }

  /// Установить цвет [color] как записанный в системный буфер в свойство [_colorInClipboard]
  Future<void> setColorInClipboard(ColorEntity? color) async {
    _colorInClipboard = color;
    notifyListeners();
  }

  /// Установить цвета [colors] как доступную для использования палитру [_colors]
  void _setColors(List<ColorEntity> colors) {
    _colors
      ..clear()
      ..addAll(colors);
    notifyListeners();
  }
}
