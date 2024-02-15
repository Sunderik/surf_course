import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:task_280049/core/di/injection.config.dart';

final injector = GetIt.instance;

@InjectableInit()
void configureInjection() {
  injector.init();
}
