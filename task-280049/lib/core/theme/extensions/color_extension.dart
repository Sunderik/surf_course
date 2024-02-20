import 'package:flutter/material.dart';
import 'package:task_280049/core/theme/color_constants.dart';

/// Расширение цветовой палитры приложения
extension CustomColorsTheme on ColorScheme {
  /// Цвет с прозрачностью для уведомлений
  Color get customOpacity {
    return customForOpacity.withOpacity(0.8);
  }

  /// Цвет с прозрачностью для тени
  Color get customShadow {
    return customForShadow.withOpacity(0.08);
  }

  /// Цвет с прозрачностью для иконок
  Color get customIcons {
    return customForIcons;
  }
}
