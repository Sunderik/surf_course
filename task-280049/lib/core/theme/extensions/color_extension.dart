import 'package:flutter/material.dart';
import 'package:task_280049/core/theme/color_constants.dart';

/// Расширение цветовой палитры приложения
extension CustomColorsTheme on ColorScheme {
  /// Цвет с прозрачностью для уведомлений
  Color get customOpacity {
    return customForOpacity.withOpacity(0.8);
  }
}
