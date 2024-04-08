import 'package:http/http.dart';

/// Модель объекта данных полученных от сервера
class RestBundle {
  /// Информация из ответа от сервера
  final String? data;

  /// Статус ответа от сервера
  final int? status;

  RestBundle({this.data, this.status});

  /// Конвертировать ответ от сервера [Response] в модель [RestBundle]
  RestBundle fromResponse(Response response) {
    return RestBundle(
      data: response.body,
      status: response.statusCode,
    );
  }
}
