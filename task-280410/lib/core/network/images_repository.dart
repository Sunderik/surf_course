import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:task_280410/core/constants/string_constants.dart';
import 'package:task_280410/core/domain/models/image_model.dart';
import 'package:task_280410/core/network/models/dtos/image_dto.dart';
import 'package:task_280410/core/network/models/rest_bundle.dart';
import 'package:task_280410/core/network/network_client.dart';

/// Интерфейс источника данных для работы с изображениями
abstract class IImagesRepository {
  /// Получить изображения
  Future<List<ImageModel>> fetchImages();
}

/// Реализация интерфейса источника данных для работы с изображениями
class ImagesRepositoryImp implements IImagesRepository {
  /// Клиент для сетевого взаимодействия
  final NetworkClient client;

  ImagesRepositoryImp(this.client);

  @override
  Future<List<ImageModel>> fetchImages() async {
    Map<String, String> params = {
      'page': '1',
      'per_page': '18',
    };

    final uri = Uri.https(StringConstants.host, StringConstants.path, params);

    final response = await client.get(uri);

    final data = RestBundle().fromResponse(response).data;

    List<ImageDto> imagesDto;
    if (data != null) {
      try {
        // Вынес в compute для облегчения нагрузки на основной поток приложения, на случай если запросят много картинок.
        Iterable imagesList = await compute(_decodeList, data);
        imagesDto = List<ImageDto>.from(imagesList.map((jsonData) => ImageDto.fromJson(jsonData)));
      } on Exception {
        return [];
      }
      List<ImageModel> images = imagesDto.map((dto) => ImageModel(heroTag: dto.id, urlPath: dto.urls.regular)).toList();
      return images;
    }
    return [];
  }
}

/// Метод верхнего уровня для декодирования json
Iterable _decodeList(String data) {
  return jsonDecode(data);
}
