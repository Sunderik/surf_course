import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/objects/objects.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen.dart';

/// Объект логики поведения окна палитры цветов
class ColorsScreenWidgetModel extends BaseWidgetModel {
  /// Объект глобального сейта приложения для работы с цветами
  late final ColorsStateModel _state;

  /// Объект логики поведения окна палитры цветов
  ColorsScreenWidgetModel({required ColorsStateModel state}) : _state = state;

  /// Список всех цветов
  List<ColorEntity> _colors = [];

  /// Контроллер патока  списка доступных цветов
  final StreamController<List<ColorEntity>> _colorsController = StreamController<List<ColorEntity>>.broadcast();

  /// Паток списка доступных цветов
  Stream<List<ColorEntity>> get colorsStream => _colorsController.stream;

  /// Селектор отсекающий пустые ццвета из списка всех цветов [_colors]
  List<ColorEntity> get _colorsSelector => _state.colors.where((color) => color.value.isNotEmpty).toList();

  /// Список всех доступных цветов
  List<ColorEntity> get colors => _colorsSelector;

  /// Цвет в системном буфере обмена
  ColorEntity? get colorInClipboard => _state.colorInClipboard;

  @override
  void init() {
    super.init();
    _state.addListener(_stateListener);

    _checkColors();
  }

  @override
  void dispose() {
    super.dispose();
    _state.removeListener(_stateListener);
    _colorsController.close();
  }

  @override
  Future<void> copyColorToClipboard(ColorEntity color) async {
    super.copyColorToClipboard(color);
    await _state.setColorInClipboard(color);
  }

  /// Перейти в окно информации о цвете [color]
  void navigateToColorPage(BuildContext context, ColorEntity color) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, secondaryAnimation) => ColorDetailsScreen(color: color),
        transitionsBuilder: (_, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  /// Проверить наличие в стейте палитры цветов, если ее нет то загрузить цвета.
  Future<void> _checkColors() async {
    if (_colorsSelector.isEmpty) {
      screenStatus = ScreenStatusesEnum.loading;
      await _state.fetchColors();
    } else {
      _stateListener();
    }
    final localHex = await getColorInClipboard();
    if (_colors.isNotEmpty && localHex.isNotEmpty) {
      final color = _colors.firstWhereOrNull((color) => color.value == localHex);
      if (color != null) {
        hexInClipboard = color;
      }
    }
  }

  /// Подписка на изменения глобального стейта
  void _stateListener() {
    _colors = _colorsSelector;
    _colorsController.sink.add(_colors);
    final localHex = _state.colorInClipboard;
    if (localHex != null) {
      hexInClipboard = localHex;
      hexInClipboardController.sink.add(localHex);
    }
    screenStatus = ScreenStatusesEnum.wait;
  }
}
