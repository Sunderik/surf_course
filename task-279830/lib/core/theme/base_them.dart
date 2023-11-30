import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/extensions/color_extension.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';
import 'package:task_279830/core/theme/theme_constants.dart';

ThemeData baseTheme(BuildContext context) {
  final theme = Theme.of(context);

  final appBarTheme = AppBarTheme(
    titleTextStyle: theme.textTheme.customTitleBold,
    centerTitle: true,
    elevation: 0.0,
  );

  final bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedLabelStyle: theme.textTheme.customIconTitle.copyWith(color: theme.colorScheme.customPrimaryColor),
    unselectedLabelStyle: theme.textTheme.customIconTitle,
    selectedItemColor: theme.colorScheme.customPrimaryColor,
    unselectedItemColor: theme.colorScheme.customSecondaryColor,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );

  return ThemeData(
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    fontFamily: "Sora",
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: customGreen,
    ),
    useMaterial3: true,
  );
}
