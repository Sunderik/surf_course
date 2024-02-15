import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/objects/objects.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen.dart';

class ColorsScreenWidgetModel extends BaseWidgetModel {
  late final ColorsStateModel _state;

  ColorsScreenWidgetModel({required ColorsStateModel state}) : _state = state;

  ///
  late List<ColorEntity> colors;

  ///
  late StreamController<List<ColorEntity>> _colorsController;

  ///
  Stream<List<ColorEntity>> get colorsStream => _colorsController.stream;

  ///
  List<ColorEntity> get _colorsSelector =>
      _state.colors.where((color) => color.value != null && color.value!.isNotEmpty).toList();

  ColorEntity? get colorInClipboard => _state.colorInClipboard;

  @override
  void init() {
    super.init();
    _state.addListener(_stateListener);
    colors = [];
    _colorsController = StreamController<List<ColorEntity>>.broadcast();

    setScreenStatus(ScreenStatusesEnum.init);

    _checkColors();
  }

  @override
  void dispose() {
    super.dispose();
    _state.removeListener(_stateListener);
    _colorsController.close();
  }

  @override
  void copyColorToClipboard(BuildContext context, ColorEntity color) {
    super.copyColorToClipboard(context, color);
    _state.setColorInClipboard(color);
  }

  void navigateToColorPage(BuildContext context, ColorEntity color) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ColorDetailsScreen(color: color),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }

  Future<void> _checkColors() async {
    if (_colorsSelector.isEmpty) {
      setScreenStatus(ScreenStatusesEnum.loading);
      await _state.fetchColors();
    } else {
      _stateListener();
    }
    final hexInClipboard = await getColorInClipboard();
    if (colors.isNotEmpty && hexInClipboard.isNotEmpty) {
      final color = colors.firstWhereOrNull((color) => color.value == hexInClipboard);
      if (color != null) {
        setHexInClipboard(color);
      }
    }
  }

  void _stateListener() {
    colors = _colorsSelector;
    _colorsController.sink.add(colors);
    hexInClipboard = _state.colorInClipboard;
    if (hexInClipboard != null) {
      hexInClipboardController.sink.add(hexInClipboard!);
    }
    setScreenStatus(ScreenStatusesEnum.wait);
  }
}
