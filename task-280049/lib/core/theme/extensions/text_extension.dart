import 'package:flutter/material.dart';
import 'package:task_280049/core/constants/colors_constants.dart';

const String _ubuntuFamily = 'Ubuntu';

/// Расширение для темы приложения с добавлением кастомных стилей текста
extension CustomTextTheme on TextTheme {
  TextStyle get customCaption {
    return const TextStyle(
      fontFamily: _ubuntuFamily,
      fontSize: 12.0,
      color: AppColors.customMain,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customText {
    return const TextStyle(
      fontFamily: _ubuntuFamily,
      fontSize: 16.0,
      color: AppColors.customMain,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customTextWhite {
    return const TextStyle(
      fontFamily: _ubuntuFamily,
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get customTitle {
    return const TextStyle(
      fontFamily: _ubuntuFamily,
      fontSize: 30.0,
      color: AppColors.customMain,
      fontWeight: FontWeight.w700,
    );
  }
}
