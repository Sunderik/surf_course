import 'package:flutter/material.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/mixins/system_bar_color_mixin.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';

///
class ColorDetailsScreenWidgetModel extends BaseWidgetModel with SystemBarColorMixin {
  late final ColorsStateModel _state;

  ///
  final ColorEntity color;

  ColorDetailsScreenWidgetModel({required this.color, required ColorsStateModel state}) : _state = state;

  ColorEntity? get colorInClipboard => _state.colorInClipboard;

  @override
  Future<void> init() async {
    super.init();
    _state.addListener(_stateListener);
    final value = color.value;
    if (value != null && value.isNotEmpty) {
      screenStatus = ScreenStatusesEnum.wait;
      setSystemBarColor(color.getColor());
      final hexInClipboard = await getColorInClipboard();
      if (hexInClipboard == value) {
        setHexInClipboard(color);
      }
    } else {
      screenStatus = ScreenStatusesEnum.fail;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _state.removeListener(_stateListener);
  }

  @override
  void copyColorToClipboard(BuildContext context, ColorEntity color) {
    super.copyColorToClipboard(context, color);
    _state.setColorInClipboard(color);
  }

  void copyChannelToClipboard(BuildContext context, int channel) {
    copyToClipboard(context, text: channel.toString());
    _state.setColorInClipboard(ColorEntity('', ''));
  }

  ///
  bool backNavigation(BuildContext context) {
    Navigator.of(context).pop();
    setSystemBarColor(Theme.of(context).colorScheme.background);
    return true;
  }

  void _stateListener() {
    hexInClipboard = _state.colorInClipboard;
    if (hexInClipboard != null) {
      hexInClipboardController.sink.add(hexInClipboard!);
    }
  }
}
