import 'package:flutter/cupertino.dart';
import 'package:task_280398/core/domain/widget_model/base_widget_model.dart';
import 'package:task_280398/core/library/change_theme_bottom_sheet/change_theme_bottom_sheet.dart';

/// Объект логики поведения окна профиля
class ProfileScreenWidgetModel extends BaseWidgetModel {
  /// Объект логики поведения окна профиля
  ProfileScreenWidgetModel();

  @override
  void init() {}

  @override
  void dispose() {}

  /// Функция открытия модального окна для смены темы
  void openChangeThemeBottomSheet(BuildContext context) {
    ChangeThemeBottomSheet(context: context).show();
  }
}
