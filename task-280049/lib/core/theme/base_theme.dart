import 'package:flutter/material.dart';
import 'package:task_280049/core/theme/extensions/snackbar_extension.dart';

///Функция генерации базовой темы приложения
ThemeData baseTheme(BuildContext context) {
  // Возвращаем переопределенную тему приложения
  return ThemeData(
    fontFamily: "Ubuntu",
    snackBarTheme: Theme.of(context).snackBarTheme.copyBufferSnackBar,
    colorScheme: ColorScheme.fromSeed(
      background: Colors.white,
      brightness: Brightness.light,
      seedColor: Colors.white,
    ),
    useMaterial3: true,
  );
}
