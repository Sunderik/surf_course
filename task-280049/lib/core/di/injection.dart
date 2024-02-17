import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Ссылка на объект доступа к DI
final injector = GetIt.instance;

/// Запуск построения дерева зависимостей на основе карты зависимостей из [injection.config.dart]
@InjectableInit()
void configureInjection() {
  injector.init();
}
