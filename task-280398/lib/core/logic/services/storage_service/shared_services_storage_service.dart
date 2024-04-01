import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_280398/core/logic/services/storage_service/storage_service.dart';

/// Интерфейс сервиса для работы с локальным хранилищем данных устройства.
class SharedPreferencesStorageService implements IStorageService {
  /// Инстанс для работы с локальным хранилищем
  final SharedPreferences _prefs;

  SharedPreferencesStorageService(SharedPreferences preferences) : _prefs = preferences;

  /// Получить значение из хранилища по ключу [key].
  @override
  T? getByKey<T>(String key) {
    final result = _prefs.get(key);

    try {
      return (result as T?);
    } catch (_) {
      throw Exception('Некорректный формат возмущаемого объекта');
    }
  }

  /// Записать значение [value] в хранилище по ключу [key].
  @override
  void set<T>(String key, T value) {
    if (T is Iterable) {
      _prefs.setStringList(key, (value as List).map((e) => e.toString()).toList());
    } else if (T is bool) {
      _prefs.setBool(key, value as bool);
    } else if (T is num) {
      if (T is int) {
        _prefs.setInt(key, value as int);
      } else if (T is double) {
        _prefs.setDouble(key, value as double);
      }
    } else {
      _prefs.setString(key, value.toString());
    }
  }
}
