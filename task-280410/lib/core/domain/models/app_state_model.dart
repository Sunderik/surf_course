import 'package:flutter/material.dart';
import 'package:task_280410/core/domain/models/image_model.dart';

/// Основной стейт приложения реализует архитектуру mwwm
class AppStateModel extends ChangeNotifier {
  /// Список доступных для просмотра изображений
  List<ImageModel>? _images;

  AppStateModel();

  /// Доступные для просмотра изображения
  List<ImageModel>? get images => _images;

  /// Установить доступные для просмотра изображения
  set images(List<ImageModel>? images) {
    _images = images;
    notifyListeners();
  }
}
