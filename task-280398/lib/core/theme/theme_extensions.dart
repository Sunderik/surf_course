import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/colors_constants.dart';

/// Темы с цветовыми схемами приложения
extension ThemeExtension on ThemeData {
  /// Первая светлая схема (Зеленая)
  ThemeData get firstLightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
            brightness: Brightness.light,
            background: AppColors.appGreenLightBackground,
            surface: AppColors.appSecondaryLight,
            surfaceVariant: AppColors.appSecondaryDarkGreen.withOpacity(0.6),
            surfaceTint: AppColors.appBottomSheetRectangleLight.withOpacity(0.2),
            onSurface: AppColors.appGreenLightOnSurface,
            error: AppColors.appError,
            primary: AppColors.appPrimaryGreen,
            secondary: AppColors.appDarkGrey,
            tertiary: AppColors.appSecondaryDarkGreen),
        useMaterial3: true,
      );

  /// Вторая светлая схема (Синяя)
  ThemeData get secondLightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
            brightness: Brightness.light,
            background: AppColors.appBlueLightBackground,
            surface: AppColors.appSecondaryLight,
            surfaceVariant: AppColors.appSecondaryDarkBlue.withOpacity(0.6),
            surfaceTint: AppColors.appBottomSheetRectangleLight.withOpacity(0.2),
            onSurface: AppColors.appBlueLightOnSurface,
            error: AppColors.appError,
            primary: AppColors.appPrimaryBlue,
            secondary: AppColors.appDarkGrey,
            tertiary: AppColors.appSecondaryDarkBlue),
        useMaterial3: true,
      );

  /// Третья светлая схема (Оранжевая)
  ThemeData get thirdLightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
            brightness: Brightness.light,
            background: AppColors.appOrangeLightBackground,
            surface: AppColors.appSecondaryLight,
            surfaceVariant: AppColors.appSecondaryDarkOrange.withOpacity(0.6),
            surfaceTint: AppColors.appBottomSheetRectangleLight.withOpacity(0.2),
            onSurface: AppColors.appOrangeLightOnSurface,
            error: AppColors.appError,
            primary: AppColors.appPrimaryOrange,
            secondary: AppColors.appDarkGrey,
            tertiary: AppColors.appSecondaryDarkOrange),
        useMaterial3: true,
      );

  /// Первая темная схема (Зеленая)
  ThemeData get firstDarkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
            brightness: Brightness.dark,
            background: AppColors.appGreenDarkBackground,
            surface: AppColors.appSecondaryDarkGreen,
            surfaceVariant: AppColors.appGreenDarkBackground.withOpacity(0.8),
            surfaceTint: AppColors.appBottomSheetRectangleDark.withOpacity(0.2),
            onSurface: AppColors.appGreenDarkOnSurface,
            error: AppColors.appError,
            primary: AppColors.appPrimaryGreen,
            secondary: AppColors.appLightGrey,
            tertiary: AppColors.appWhite),
        useMaterial3: true,
      );

  /// Вторая темная схема (Синяя)
  ThemeData get secondDarkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
            brightness: Brightness.dark,
            background: AppColors.appBlueDarkBackground,
            surface: AppColors.appSecondaryDarkBlue,
            surfaceVariant: AppColors.appBlueDarkBackground.withOpacity(0.8),
            surfaceTint: AppColors.appBottomSheetRectangleDark.withOpacity(0.2),
            onSurface: AppColors.appBlueDarkOnSurface,
            error: AppColors.appError,
            primary: AppColors.appPrimaryBlue,
            secondary: AppColors.appLightGrey,
            tertiary: AppColors.appWhite),
        useMaterial3: true,
      );

  /// Третья темная схема (Оранжевая)
  ThemeData get thirdDarkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent).copyWith(
            brightness: Brightness.dark,
            background: AppColors.appOrangeDarkBackground,
            surface: AppColors.appSecondaryDarkOrange,
            surfaceVariant: AppColors.appOrangeDarkBackground.withOpacity(0.8),
            surfaceTint: AppColors.appBottomSheetRectangleDark.withOpacity(0.2),
            onSurface: AppColors.appOrangeDarkOnSurface,
            error: AppColors.appError,
            primary: AppColors.appPrimaryOrange,
            secondary: AppColors.appLightGrey,
            tertiary: AppColors.appWhite),
        useMaterial3: true,
      );
}
