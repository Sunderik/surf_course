import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_280049/core/logic/mappers/color_mapper.dart';
import 'package:task_280049/core/logic/objects/dtos/color_dto.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/logic/services/file_service.dart';

///Путь к файлу доступных для палитры цветов.
const String _pathToColorFile = 'assets/colors.json';

/// Интерфейс репозитория работы с цветами
abstract class IColorsRepository {
  /// Получить список всех доступных цветов.
  Future<List<ColorEntity>> fetchColors();
}

/// Реализация интерфейса репозитория работы с цветами
@Injectable(as: IColorsRepository)
class ColorsRepositoryImpl implements IColorsRepository {
  /// Экземпляр сервиса по работе с файлами
  final IFileService _fileService;

  /// Экземпляр маппера сущностей цвета
  final ColorMapper _colorsMapper;

  ColorsRepositoryImpl(this._fileService, this._colorsMapper);

  @override
  Future<List<ColorEntity>> fetchColors() async {
    final stringData = await _fileService.loadJsonFileFromAssets(_pathToColorFile);

    /// Выносим дессираилизацию в отдельный изволят .чтобы не повесить приложение, в случае большой палитры доступных цветов.
    return compute(_mapColorsDto, (_colorsMapper, stringData));
  }
}

/// Метод конвертации информации [data] из json в модель  списка [ColorEntity]
List<ColorEntity> _mapColorsDto((ColorMapper, String) data) {
  final Map<String, dynamic> jsonData = json.decode(data.$2);

  Iterable l = json.decode(jsonData['colors']);
  List<ColorDto> colors = List<ColorDto>.from(l.map((model) => ColorDto.fromJson(model)));
  List<ColorDto> validColors = colors.where((color) => color.value != null && color.value!.isNotEmpty).toList();
  return data.$1.mapColors(validColors);
}
