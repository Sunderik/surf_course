import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/color_constants.dart';

/// Расширение темы приложения для кнопок
extension CustomButtonTheme on ElevatedButtonThemeData {
  /// Пользовательская кнопка
  ButtonStyle get customElevatedButton {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => customGreen),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
      }),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => const TextStyle(
          fontFamily: 'Sora',
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  /// Кнопка для модельного окна сортировки
  ButtonStyle get sortingElevatedButton {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => customGreen),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
      }),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => const TextStyle(
          fontFamily: 'Sora',
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
