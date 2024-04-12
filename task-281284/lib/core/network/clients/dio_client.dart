import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_281284/environments/environments.dart';

/// Обработчик сериализация запросов и ответов в отдельном патоке.
class _ComputeTransformer extends BackgroundTransformer {
  @override
  Future<String> transformRequest(RequestOptions options) async {
    return compute(super.transformRequest, options);
  }

  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    // TODO: как бы пропихнуть в compute функцию с двумя параметрами
    // return compute(super.transformResponse, (options, responseBody));
    return super.transformResponse(options, responseBody);
  }
}

/// Клиент взаимодействия с сервером через пакет DIO
class DioClient {
  /// Сконфигурировать клиент на основе DIO пакета
  static Dio configure() {
    return Dio()
      ..options.baseUrl = Environments.baseUrl
      ..options.connectTimeout = const Duration(seconds: Environments.connectTimeout)
      ..options.receiveTimeout = const Duration(seconds: Environments.receiveTimeout)
      ..transformer = _ComputeTransformer();
  }
}
