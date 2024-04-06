import 'package:http/http.dart';
import 'package:task_280410/core/constants/string_constants.dart';
import 'package:task_280410/core/domain/models/interceptor.dart';

/// Интерцептор подписи запроса ключом доступа к ресурсу unsplash.com
class AuthInterceptor implements Interceptor {
  @override
  BaseRequest intercept(BaseRequest request) {
    request.headers.update('Authorization', (update) => 'Client-ID ${StringConstants.accessToken}',
        ifAbsent: () => 'Client-ID ${StringConstants.accessToken}');

    return request;
  }

  @override
  String toString() {
    return 'AuthInterceptor()';
  }
}
