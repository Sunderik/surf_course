/// Интерфейс сервиса для работы с хранилищем формата "Ключ-Значение"
abstract class IStorageService {
  /// Получить значение из хранилища по ключу [key].
  T? getByKey<T>(String key);

  /// Записать значение [value] в хранилище по ключу [key].
  void set<T>(String key, T value);
}
