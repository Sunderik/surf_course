import 'package:flutter/material.dart';
import 'package:task_280049/core/constants/colors_constants.dart';

/// Расширение цветовой палитры приложения
extension CustomColorsTheme on ColorScheme {
  /// Цвет с прозрачностью для уведомлений
  Color get customOpacity {
    return AppColors.customForOpacity.withOpacity(0.8);
  }

  /// Цвет с прозрачностью для тени
  Color get customShadow {
    return AppColors.customForShadow.withOpacity(0.08);
  }

  /// Цвет с прозрачностью для иконок
  Color get customIcons {
    return AppColors.customForIcons;
  }
}
