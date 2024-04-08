import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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

class DioClient {
  static Dio configure() {
    return Dio()
      ..options.baseUrl = 'https://eightballapi.com/api'
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 3)
      ..transformer = _ComputeTransformer();
  }
}
