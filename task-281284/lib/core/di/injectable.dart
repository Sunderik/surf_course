import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_281284/core/logic/fortune_repository.dart';
import 'package:task_281284/core/network/clients/dio_client.dart';
import 'package:task_281284/core/network/clients/rest_client.dart';

/// Экземпляр для доступа к зависимостям
final injector = GetIt.instance;

/// Сконфигурировать зависимости приложения
Future<void> configureDependencyInjections() async {
  injector
    ..registerSingleton(DioClient.configure())
    ..registerSingleton<RestClient>(RestClient(injector<Dio>()))
    ..registerSingleton<IFortuneRepository>(FortuneRepositoryImp(injector.get<RestClient>()));
  await injector.allReady();
}
