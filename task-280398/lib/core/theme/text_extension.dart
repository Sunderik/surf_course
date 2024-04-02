import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/colors_constants.dart';

/// Основное семейство шрифтов
const String _family = 'SF Pro Display';

/// Расширение для темы приложения с добавлением кастомных стилей текста
extension CustomTextTheme on TextTheme {
  /// Шрифт заголовка окна
  TextStyle get customTitle {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 18.0,
      color: AppColors.appWhite,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get customNormal {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customButton {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customCaption {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    );
  }
}
