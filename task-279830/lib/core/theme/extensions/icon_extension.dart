import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/color_constants.dart';

/// Расширение для иконок используемых в приложении в нижнем меню навигации
extension CustomIconTheme on IconThemeData {
  /// Тема для отображения иконки в выбранном состоянии
  IconThemeData get selectableIcon {
    return const IconThemeData(size: 24, color: customGreen);
  }

  /// Тема для отображения иконки в не выбранном состоянии
  IconThemeData get unSelectableIcon {
    return const IconThemeData(size: 24, color: customVioletLight);
  }
}
