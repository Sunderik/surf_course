import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/color_constants.dart';

/// Расширение цветовой палитры приложения
extension CustomColorsTheme on ColorScheme {
  /// Основной цвет
  Color get customPrimaryColor {
    return customGreen;
  }

  /// Второстепенный цвет
  Color get customSecondaryColor {
    return customVioletLight;
  }

  /// Базовый цвет текста
  Color get customTextColor {
    return customVioletDark;
  }

  /// Базовый цвет текста
  Color get customBorderColor {
    return customGrey;
  }
}
