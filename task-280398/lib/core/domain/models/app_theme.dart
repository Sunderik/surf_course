import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/theme/theme_extensions.dart';

/// Объект темы приложения
sealed class AppTheme extends Equatable {
  /// Номер темы
  final int number;

  /// Яркость темы
  final Brightness brightness;

  /// Тема приложения
  const AppTheme({required this.number, required this.brightness})
      : assert(number > 0),
        assert(number < 4);

  /// Системная тема приложения
  AppTheme.system()
      : number = 0,
        brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

  @override
  List<Object> get props => [number, brightness];

  /// Парсинг темы в строку
  @override
  String toString() {
    return '$number-${brightness.name}';
  }

  /// Парсинг темы из строки
  static AppTheme fromString(String str) {
    final values = str.split('-');
    final themeNumber = int.parse(values[0]);
    final themeBrightness = Brightness.values.firstWhere((v) => v.name == values[1]);

    switch (themeNumber) {
      case 0:
        return SystemTheme();
      case 1:
        return themeBrightness == Brightness.light ? const FirstLightTheme() : const FirstDarkTheme();
      case 2:
        return themeBrightness == Brightness.light ? const SecondLightTheme() : const SecondDarkTheme();
      case 3:
        return themeBrightness == Brightness.light ? const ThirdLightTheme() : const ThirdDarkTheme();
      default:
        throw Exception('Unexpected theme number');
    }
  }

  /// Получить информацию из темы
  ThemeData getThemeDataByTheme(BuildContext context);

  /// Получить название типа темы
  String get getThemeTypeName;
}

/// Системная тема приложения
class SystemTheme extends AppTheme {
  SystemTheme() : super.system();

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return brightness == Brightness.light
        ? const FirstLightTheme().getThemeDataByTheme(context)
        : const FirstDarkTheme().getThemeDataByTheme(context);
  }

  @override
  String get getThemeTypeName => StringsConstants.systemThemeTypeName;
}

/// Первая светлая тема приложения
class FirstLightTheme extends AppTheme {
  const FirstLightTheme({super.number = 1, super.brightness = Brightness.light});

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return Theme.of(context).firstLightTheme;
  }

  @override
  String get getThemeTypeName => StringsConstants.lightThemeTypeName;
}

/// Вторая светлая тема приложения
class SecondLightTheme extends AppTheme {
  const SecondLightTheme({super.number = 2, super.brightness = Brightness.light});

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return Theme.of(context).secondLightTheme;
  }

  @override
  String get getThemeTypeName => StringsConstants.lightThemeTypeName;
}

/// Третья светлая тема приложения
class ThirdLightTheme extends AppTheme {
  const ThirdLightTheme({super.number = 3, super.brightness = Brightness.light});

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return Theme.of(context).thirdLightTheme;
  }

  @override
  String get getThemeTypeName => StringsConstants.lightThemeTypeName;
}

/// Первая темная тема приложения
class FirstDarkTheme extends AppTheme {
  const FirstDarkTheme({super.number = 1, super.brightness = Brightness.dark});

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return Theme.of(context).firstDarkTheme;
  }

  @override
  String get getThemeTypeName => StringsConstants.darkThemeTypeName;
}

/// Вторая темная тема приложения
class SecondDarkTheme extends AppTheme {
  const SecondDarkTheme({super.number = 2, super.brightness = Brightness.dark});

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return Theme.of(context).secondDarkTheme;
  }

  @override
  String get getThemeTypeName => StringsConstants.darkThemeTypeName;
}

/// Третья темная тема приложения
class ThirdDarkTheme extends AppTheme {
  const ThirdDarkTheme({super.number = 3, super.brightness = Brightness.dark});

  @override
  ThemeData getThemeDataByTheme(BuildContext context) {
    return Theme.of(context).thirdDarkTheme;
  }

  @override
  String get getThemeTypeName => StringsConstants.darkThemeTypeName;
}
