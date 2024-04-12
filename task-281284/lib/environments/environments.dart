/// Переменные окружения
class Environments {
  /// Адрес сервера
  static const String baseUrl = String.fromEnvironment('base_url');

  /// Ожидание подключения
  static const int connectTimeout = int.fromEnvironment('connection_timeout');

  /// Ожидание до повторного запроса
  static const int receiveTimeout = int.fromEnvironment('receive_timeout');
}
