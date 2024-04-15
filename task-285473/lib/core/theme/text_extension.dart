import 'package:flutter/material.dart';
import 'package:task_285473/core/constants/colors_constants.dart';

/// Основное семейство шрифтов
const String _family = 'SF Pro Display';

/// Расширение для темы приложения с добавлением кастомных стилей текста
extension CustomTextTheme on TextTheme {
  /// Шрифт заголовка
  TextStyle get sectionTitle {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 24.0,
      color: ColorsConstants.appBlack,
      fontWeight: FontWeight.w600,
    );
  }

  /// Шрифт заголовка радиокнопки
  TextStyle get radioTitle {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 12.0,
      color: ColorsConstants.appBlack,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт заголовка чекбокса
  TextStyle get checkboxTitle {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 16.0,
      color: ColorsConstants.appBlack,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт заголовка чекбокса
  TextStyle get buttonTitle {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
  }

  /// Шрифт подсказки поля ввода
  static TextStyle get inputHint {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 16.0,
      color: ColorsConstants.appGrey,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт заголовка поля ввода
  static TextStyle get inputTitle {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 12.0,
      color: ColorsConstants.appGrey,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт содержимого поля ввода
  TextStyle get inputContent {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 16.0,
      color: ColorsConstants.appBlack,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт содержимого поля ввода во время ошибки валидации
  TextStyle get inputContentError {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 16.0,
      color: ColorsConstants.appError,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт ошибки валидации поля ввода
  TextStyle get inputError {
    return const TextStyle(
      fontFamily: _family,
      fontSize: 12.0,
      color: ColorsConstants.appError,
      fontWeight: FontWeight.w400,
    );
  }

  /// Шрифт скрытой ошибки валидации поля ввода
  static TextStyle get inputTransparentError {
    return const TextStyle(
      color: Colors.transparent,
      fontSize: 0,
    );
  }
}
