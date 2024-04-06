import 'package:http/http.dart';
import 'package:task_280410/core/constants/string_constants.dart';
import 'package:task_280410/core/network/auth_interceptor.dart';

/// Интерфейс клиента сетевого взаимодействия
abstract class NetworkClient {
  Future<RESP> get<RESP>(Uri path);
}

/// Реализация клиента сетевого взаимодействия через http библиотеку
class HttpClient implements NetworkClient {
  /// клиента сетевого взаимодействия
  final Client _client;

  HttpClient() : _client = Client();

  /// Выполнить запрос на получения данных по адресу [path]
  @override
  Future<RESP> get<RESP>(Uri path) async {
    final request = Request(StringConstants.methodGet, path);

    _authInterceptRequest(request);

    final response = await Response.fromStream(
      await _client.send(request).catchError(
        (error, stackTrace) {
          throw error;
        },
      ),
    );

    return response as RESP;
  }

  /// Подписать запрос ключом доступа
  void _authInterceptRequest(BaseRequest request) {
    try {
      AuthInterceptor().intercept(request);
    } on Exception {
      rethrow;
    }
  }
}
