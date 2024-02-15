import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_280049/core/logic/objects/dtos/colors_dto.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/logic/services/file_service.dart';

const String _pathToColorFile = 'assets/colors.json';

abstract class IColorsRepository {
  Future<List<ColorEntity>> fetchColors();
}

@Injectable(as: IColorsRepository)
class ColorsRepositoryImpl implements IColorsRepository {
  final IFileService _fileService;

  ColorsRepositoryImpl(this._fileService);

  @override
  Future<List<ColorEntity>> fetchColors() async {
    final stringData = await _fileService.loadJsonFileFromAssets(_pathToColorFile);

    return compute(mapColorsDto, stringData);
  }
}

List<ColorEntity> mapColorsDto(String data) {
  final Map<String, dynamic> jsonData = json.decode(data);
  final list = ColorsDto.fromJson(jsonData);
  return list.colors.map((e) => ColorEntity.fromDto(e)).toList();
}
