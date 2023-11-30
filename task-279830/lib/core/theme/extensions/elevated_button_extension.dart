import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/theme_constants.dart';

extension CustomButtonTheme on ElevatedButtonThemeData {
  /// Основной цвет
  ButtonStyle get customElevatedButton {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => customGreen),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
      }),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => TextStyle(
          fontFamily: 'Sora',
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
