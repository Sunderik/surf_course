import 'package:flutter/material.dart';
import 'package:task_281284/core/constants/colors_constants.dart';

/// Расширение для темы приложения с добавлением кастомных стилей текста
extension CustomTextTheme on TextTheme {
  /// Шрифт заголовка окна
  TextStyle get hintTheme {
    return const TextStyle(
      fontSize: 16.0,
      color: ColorsConstants.appHint,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get messageTheme {
    return const TextStyle(
      fontSize: 32.0,
      color: ColorsConstants.appText,
      fontWeight: FontWeight.w400,
    );
  }
}
