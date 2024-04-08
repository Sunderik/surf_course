import 'package:http/http.dart';

/// базовая модель интерцептора
interface class Interceptor {
  /// Применить интерцептор к запросу [request]
  BaseRequest intercept(BaseRequest request) {
    return request;
  }
}
