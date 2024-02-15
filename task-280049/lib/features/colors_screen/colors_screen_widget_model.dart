import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/mixins/buffer_mixin.dart';
import 'package:task_280049/core/logic/objects/objects.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen.dart';

class ColorsScreenWidgetModel extends BaseWidgetModel with BufferMixin {
  late ColorsStateModel state;

  ColorsScreenWidgetModel({required this.state});

  late ScreenStatusesEnum screenStatus;
  late List<ColorEntity> colors;

  ///
  late StreamController<List<ColorEntity>> _colorsController;

  ///
  Stream<List<ColorEntity>> get colorsStream => _colorsController.stream;

  ///
  late StreamController<ScreenStatusesEnum> _screenStatusController;

  ///
  Stream<ScreenStatusesEnum> get screenStatusStream => _screenStatusController.stream;

  ///
  List<ColorEntity> get _colorsSelector =>
      state.colors.where((color) => color.value != null && color.value!.isNotEmpty).toList();

  @override
  void init() {
    super.init();
    state.addListener(_colorsListener);
    colors = [];
    _colorsController = StreamController<List<ColorEntity>>.broadcast();
    _screenStatusController = StreamController<ScreenStatusesEnum>.broadcast();
    _setScreenStatus(ScreenStatusesEnum.init);
    _checkColors();
  }

  @override
  void dispose() {
    super.dispose();
    state.removeListener(_colorsListener);
    _colorsController.close();
    _screenStatusController.close();
  }

  void navigateToColorPage(BuildContext context, ColorEntity color) {
    state.selectedColor = color;
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Provider<ColorsStateModel>(
            create: (ctx) => state, dispose: (ctx, wm) => wm.dispose(), child: const ColorDetailsScreen()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
    );
  }

  void copyColorToBuffer(BuildContext context, ColorEntity color) {
    copyToBuffer(context, text: color.value ?? '', message: 'Hex скопирован');
  }

  void _checkColors() {
    if (_colorsSelector.isEmpty) {
      _setScreenStatus(ScreenStatusesEnum.loading);
      state.fetchColors();
    } else {
      _colorsListener();
    }
  }

  void _colorsListener() {
    colors = _colorsSelector;
    _colorsController.sink.add(colors);
    _setScreenStatus(ScreenStatusesEnum.wait);
  }

  void _setScreenStatus(ScreenStatusesEnum status) {
    screenStatus = status;
    _screenStatusController.sink.add(status);
  }
}
