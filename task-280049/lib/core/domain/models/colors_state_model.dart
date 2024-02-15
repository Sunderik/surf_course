import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';

@singleton
class ColorsStateModel extends ChangeNotifier {
  final ColorsUseCase _useCases;

  ColorsStateModel(this._useCases);

  /// Список используемых цветов
  final List<ColorEntity> _colors = [];

  ///
  ColorEntity? _colorInClipboard;

  /// Цвета
  UnmodifiableListView<ColorEntity> get colors => UnmodifiableListView(_colors);

  /// Цвета
  ColorEntity? get colorInClipboard => _colorInClipboard;

  Future<void> fetchColors() async {
    final colors = await _useCases.fetchColors();
    _setColors(colors);
  }

  Future<void> setColorInClipboard(ColorEntity? color) async {
    _colorInClipboard = color;
    notifyListeners();
  }

  void _setColors(List<ColorEntity> colors) {
    _colors
      ..clear()
      ..addAll(colors);
    notifyListeners();
  }
}
