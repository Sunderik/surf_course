import 'package:http/http.dart';

/// базовая модель интерцептора
mixin Interceptor {
  /// Применить интерцептор к запросу [request]
  BaseRequest intercept(BaseRequest request);
}
