import 'package:flutter/services.dart';

/// Миксин для взаимодействия с системной полоской состояния устройства для изменения ее цвета.
mixin SystemBarColorMixin {
  /// Установить цвет фона полоски на указанный в [color], цвет иконок изменится на белый или черный,
  /// в зависимости от лучшей контрастности с фоном
  setSystemBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: color.computeLuminance() < 0.5 ? Brightness.light : Brightness.dark,
        statusBarBrightness: color.computeLuminance() < 0.5 ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
