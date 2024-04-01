import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/di/injection.dart';
import 'package:task_280398/core/domain/models/app_state_model.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/logic/services/storage_service/storage_service.dart';

/// Клас предварительной настройки приложения
class AppStarter {
  /// Метод предварительной настройки
  static Future<void> startApp() async {
    // Получаем тему из локального хранилища
    final saveTheme = injector.get<IStorageService>().getByKey<String>(StringsConstants.prefsThemeKey);
    // Получаем глобальное состояние приложения
    final state = injector.get<AppStateModel>();

    // Если сохраненной темы нету
    if (saveTheme == null || saveTheme.isEmpty) {
      // Устанавливаем системную тему как текущую
      state.currentTheme = SystemTheme();
    } else {
      // Иначе устанавливаем сохраненную тему
      state.currentTheme = AppTheme.fromString(saveTheme);
    }
  }
}
