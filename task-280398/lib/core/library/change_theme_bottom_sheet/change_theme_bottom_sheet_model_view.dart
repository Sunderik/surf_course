import 'dart:ui';

import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/domain/models/app_state_model.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/domain/widget_model/base_widget_model.dart';

/// Объект логики поведения окна
class ChangeThemeBottomSheetWidgetModel extends BaseWidgetModel {
  /// Объект глобального сейта приложения
  late final AppStateModel _state;

  /// Объект логики поведения окна
  ChangeThemeBottomSheetWidgetModel({required AppStateModel state}) : _state = state;

  /// Глобальное состояние приложения
  AppStateModel get appState => _state;

  /// Признак того что выбранная тема системная
  bool get _isSystemTheme => selectedTheme is SystemTheme;

  /// Признак того что выбранная тема светлая
  bool get _isLightTheme => selectedTheme is! SystemTheme && selectedTheme.brightness == Brightness.light;

  /// Признак того что выбранная тема темная
  bool get _isDarkTheme => selectedTheme is! SystemTheme && selectedTheme.brightness == Brightness.dark;

  /// Список светлых схем
  Set<AppTheme> lightSchemas = {const FirstLightTheme(), const SecondLightTheme(), const ThirdLightTheme()};

  /// Список темных схем
  Set<AppTheme> darkSchemas = {const FirstDarkTheme(), const SecondDarkTheme(), const ThirdDarkTheme()};

  /// Список типов тем
  List<ThemeType> themeTypes = <ThemeType>[];

  /// Выбранная тема
  late AppTheme selectedTheme;

  @override
  void init() {
    // Присваиваем выбранной теме текущую
    selectedTheme = _state.currentTheme;
    _generateThemeTypes();
  }

  @override
  void dispose() {}

  /// Действие выполняемое при выборе темы
  void onThemeTypeTap(int index) {
    for (var element in themeTypes) {
      element.isSelected = false;
    }
    themeTypes[index].isSelected = true;
    if (index == 0) {
      selectedTheme = SystemTheme();
    }
    if (index == 1 && selectedTheme.brightness != Brightness.light) {
      selectedTheme = lightSchemas.first;
    }
    if (index == 2 && selectedTheme.brightness != Brightness.dark) {
      selectedTheme = darkSchemas.first;
    }
  }

  /// Действие выполняемое при выборе схемы
  void onSchemeTap(AppTheme scheme) {
    selectedTheme = scheme;
  }

  /// Действие выполняемое при сохранении темы
  void saveTheme() {
    _state.currentTheme = selectedTheme;
  }

  /// Заполняет список типов тем
  void _generateThemeTypes() {
    themeTypes.add(ThemeType(isSelected: _isSystemTheme, name: StringsConstants.systemThemeTypeName));
    themeTypes
        .add(ThemeType(isSelected: _isLightTheme, name: StringsConstants.lightThemeTypeName, schemas: lightSchemas));
    themeTypes.add(ThemeType(isSelected: _isDarkTheme, name: StringsConstants.darkThemeTypeName, schemas: darkSchemas));
  }
}

/// Модель типа темы
class ThemeType {
  /// Тема выбрана
  bool isSelected;

  /// Название темы
  final String name;

  /// Набор схем относящихся к теме
  final Set<AppTheme>? schemas;

  ThemeType({required this.isSelected, required this.name, this.schemas});
}
