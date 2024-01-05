import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/color_constants.dart';
import 'package:task_279830/core/theme/extensions/color_extension.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

///Функция генерации базовой темы приложения
ThemeData baseTheme(BuildContext context) {
  /// Текущая темпа приложения
  final theme = Theme.of(context);

  /// Переопределенная тема для  AppBar
  final appBarTheme = AppBarTheme(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      titleTextStyle: theme.textTheme.customTitleBoldDark,
      centerTitle: true,
      elevation: 0.0);

  /// Переопределенная тема для BottomNavigationBar
  final bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedLabelStyle: theme.textTheme.customIconTitle.copyWith(color: theme.colorScheme.customPrimaryColor),
    unselectedLabelStyle: theme.textTheme.customIconTitle,
    selectedItemColor: theme.colorScheme.customPrimaryColor,
    unselectedItemColor: theme.colorScheme.customSecondaryColor,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );

  // Возвращаем переопределенную тему приложения
  return ThemeData(
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    fontFamily: "Sora",
    colorScheme: ColorScheme.fromSeed(
      background: Colors.white,
      brightness: Brightness.light,
      seedColor: customGreen,
    ),
    useMaterial3: true,
  );
}
