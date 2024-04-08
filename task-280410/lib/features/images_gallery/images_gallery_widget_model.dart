import 'dart:async';

import 'package:task_280410/core/core.dart';
import 'package:task_280410/core/domain/models/image_model.dart';
import 'package:task_280410/core/network/images_repository.dart';

/// Объект логики поведения окна галереи изображений
class ImagesGalleryWidgetModel extends BaseWidgetModel {
  /// Глобальный стейт приложения
  AppStateModel appState;

  /// Источник данных для получения изображений
  final IImagesRepository _repository;

  /// Объект логики поведения окна галереи изображений
  ImagesGalleryWidgetModel(this._repository, {required this.appState});

  /// Контроллер списка изображений
  final imagesController = StreamController<List<ImageModel>?>.broadcast();

  @override
  void init() {
    if (images == null) {
      _fetchImages();
    }

    _sinkImages();
  }

  @override
  void dispose() {
    imagesController.close();
  }

  /// Список доступных изображений  из глобального остейта
  @override
  List<ImageModel>? get images => appState.images;

  /// Запрос изображений с сервера
  Future<void> _fetchImages() async {
    if (images?.isNotEmpty ?? false) {
      return;
    }
    final loadedImages = await _repository.fetchImages();
    appState.images = loadedImages;
  }

  /// Уведомить контроллер о наличии изображений в глобальном стейте
  void _sinkImages() {
    imagesController.sink.add(images);
  }
}
