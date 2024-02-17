import 'package:flutter/material.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/mixins/system_bar_color_mixin.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';

/// Объект логики поведения окна информации о цвете
class ColorDetailsScreenWidgetModel extends BaseWidgetModel with SystemBarColorMixin {
  /// Объект глобального сейта приложения для работы с цветами
  late final ColorsStateModel _state;

  /// Цвет который используется в окне
  final ColorEntity color;

  /// Объект логики поведения окна информации о цвете
  ColorDetailsScreenWidgetModel({required this.color, required ColorsStateModel state}) : _state = state;

  /// Цвет в буфере обмена
  ColorEntity? get colorInClipboard => _state.colorInClipboard;

  @override
  Future<void> init() async {
    super.init();
    _state.addListener(_stateListener);
    final value = color.value;
    if (value != null && value.isNotEmpty) {
      screenStatus = ScreenStatusesEnum.wait;
      setSystemBarColor(color.getColor());
      final localHex = await getColorInClipboard();
      if (localHex == value) {
        hexInClipboard = color;
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
  Future<void> copyColorToClipboard(ColorEntity color) async {
    super.copyColorToClipboard(color);
    await _state.setColorInClipboard(color);
  }

  /// Копировать канал цвета в буфер
  void copyChannelToClipboard(BuildContext context, int channel) {
    copyToClipboard(text: channel.toString());
    _state.setColorInClipboard(ColorEntity.empty());
  }

  /// Выполнить возвращение на предыдущий экран
  bool backNavigation(BuildContext context) {
    Navigator.of(context).pop();
    setSystemBarColor(Theme.of(context).colorScheme.background);
    return true;
  }

  /// Подписка на изменения глобального стейта
  void _stateListener() {
    final localHex = _state.colorInClipboard;
    if (localHex != null) {
      hexInClipboard = localHex;
      hexInClipboardController.sink.add(localHex);
    }
  }
}
