import 'package:flutter/material.dart';

///Функция генерации базовой темы приложения
ThemeData get baseTheme {
  // Возвращаем переопределенную тему приложения
  return ThemeData(
    fontFamily: "Ubuntu",
    // snackBarTheme: Theme.of(context).snackBarTheme.copyBufferSnackBar,
    colorScheme: ColorScheme.fromSeed(
      background: Colors.white,
      brightness: Brightness.light,
      seedColor: Colors.white,
    ),
    useMaterial3: true,
  );
}
