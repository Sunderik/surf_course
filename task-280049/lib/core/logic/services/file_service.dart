import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

/// Интерфейс сервиса по работе с файлами
abstract class IFileService {
  /// Загрузить данные json файла из ассетов приложения, где [path] путь к файлу.
  Future<String> loadJsonFileFromAssets(String path);
}

///  Реализация интерфейса сервиса по работе с файлами
@Injectable(as: IFileService)
class FileServiceImpl implements IFileService {
  @override
  Future<String> loadJsonFileFromAssets(String path) async {
    if (path.isEmpty) {
      return Future.error('Путь к файлу данных пуст.');
    }

    if (!path.contains('.json')) {
      return Future.error('Неверный формат указанного файла.');
    }

    try {
      return await rootBundle.loadString(path);
    } catch (_) {
      return Future.error('Указанный файл данных не найден.');
    }
  }
}
