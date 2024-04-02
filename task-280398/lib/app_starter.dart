import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/di/injection.dart';
import 'package:task_280398/core/domain/models/app_state_model.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/logic/services/storage_service/storage_service.dart';

/// Клас предварительной настройки приложения
class AppStarter {
  /// Метод предварительной настройки
  static Future<void> startApp() async {
    final saveTheme = injector.get<IStorageService>().getByKey<String>(StringsConstants.prefsThemeKey);

    final state = injector.get<AppStateModel>();

    if (saveTheme == null || saveTheme.isEmpty) {
      state.currentTheme = SystemTheme();
    } else {
      state.currentTheme = AppTheme.fromString(saveTheme);
    }
  }
}
