import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_280398/core/domain/models/app_state_model.dart';
import 'package:task_280398/core/logic/services/storage_service/shared_services_storage_service.dart';
import 'package:task_280398/core/logic/services/storage_service/storage_service.dart';

/// Ссылка на объект доступа к DI
final injector = GetIt.instance;

Future configureInjection() async {
  /// Инжектим основной стейт приложения
  injector.registerSingleton<AppStateModel>(AppStateModel());

  /// Инжектим экземпляр локального хранилища
  injector.registerSingletonAsync<SharedPreferences>(() async => SharedPreferences.getInstance());

  /// Инжектим сервис по работе с  локальным хранилищем
  injector.registerSingletonWithDependencies<IStorageService>(
      () => SharedPreferencesStorageService(injector.get<SharedPreferences>()),
      dependsOn: [SharedPreferences]);
  await injector.allReady();
}
