import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class IFileService {
  Future<String> loadJsonFileFromAssets(String path);
}

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
