import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/colors_constants.dart';

/// Расширение для темы текстовых кнопок
extension TextButtonsExtension on TextButtonThemeData {
  /// Тема базовой текстовых кнопки
  TextButtonThemeData get mainButton => TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.appError),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.appError),
            borderRadius: BorderRadius.circular(16.0),
          )),
        ),
      );
}

/// Расширение для темы приподнятых кнопок
extension ElevatedButtonsExtension on ElevatedButtonThemeData {
  /// Тема базовой приподнятой кнопки
  ElevatedButtonThemeData get mainButton => ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.appWhite),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        ),
      );
}
