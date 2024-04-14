import 'package:flutter/material.dart';
import 'package:task_285473/core/constants/colors_constants.dart';
import 'package:task_285473/core/theme/button_extensions.dart';
import 'package:task_285473/core/theme/input_extensions.dart';

/// Темы с цветовыми схемами приложения
extension ThemeExtension on ThemeData {
  /// Базовая тема
  ThemeData get mainTheme => ThemeData(
        checkboxTheme: CheckboxExtension.mainCheckbox,
        inputDecorationTheme: InputDecorationExtension.baseTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
          brightness: Brightness.light,
          background: ColorsConstants.appBackground,
          primary: ColorsConstants.appActive,
        ),
        useMaterial3: true,
      );
}
