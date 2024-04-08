/// Строковые константы приложения
class StringConstants {
  /// Тип используемого запроса
  static const methodGet = 'GET';

  /// Путь к ресурсу с картинками
  static const String host = 'api.unsplash.com';

  /// Путь получения картинок
  static const String path = '/photos';

  // TODO: по хорошему бы вынести в конфиг или в переменную среды, но лень.
  /// Токен доступа к API https://unsplash.com/
  static const accessToken = '0Qk_2LItT7Df5eVvVY97FaUmKlEluA63pZmZakKyZf0';

  /// Путь к файлу логотипа приложения
  static const logoAssetPath = 'assets/logo.png';
}
