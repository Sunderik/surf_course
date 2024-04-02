import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/logic/services/storage_service/storage_service.dart';

import '../../di/injection.dart';

/// Основной стейт приложения реализует архитектуру mwwm
class AppStateModel extends ChangeNotifier {
  AppStateModel();

  /// Текущая тема приложения
  AppTheme? _currentTheme;

  /// Получить текущую тему приложения
  AppTheme get currentTheme {
    final theme = _currentTheme;
    if (theme != null) {
      return theme;
    }
    throw Exception('Current theme is null!');
  }

  /// Установить тему [theme] как текущую тему приложения [_currentTheme]
  set currentTheme(AppTheme theme) {
    if (theme != _currentTheme) {
      _currentTheme = theme;
      injector.get<IStorageService>().set(StringsConstants.prefsThemeKey, theme.toString());
      notifyListeners();
    }
  }
}
