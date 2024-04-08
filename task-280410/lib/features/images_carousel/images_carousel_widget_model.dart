import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_280410/core/core.dart';
import 'package:task_280410/core/domain/models/image_model.dart';

const _defaultAnimDuration = Duration(milliseconds: 300);

/// Объект логики поведения окна карусели изображений
class ImageCarouselWidgetModel extends BaseWidgetModel {
  /// Глобальный стейт приложения
  AppStateModel appState;

  /// Изображение на переднем плане при открытии окна
  ImageModel openedFrontImage;

  /// Объект логики поведения окна карусели изображений
  ImageCarouselWidgetModel({required this.appState, required this.openedFrontImage}) {
    pageController = PageController(initialPage: _currentPageIndex(openedFrontImage), viewportFraction: 0.65);
  }

  /// Контроллер карусели изображений
  late final PageController pageController;

  /// Индекс текущего изображения на переднем плане
  late int currentPageIndex;

  /// Контроллер текущего изображения на переднем плане
  final currentFrontImageController = StreamController<int>.broadcast();

  @override
  void init() {
    currentPageIndex = _currentPageIndex(openedFrontImage);

    /// С этого момента при любом изменении, произошедшем в PageController,
    /// будет вызвать метод _onPageChanged
    pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    currentFrontImageController.close();
  }

  /// Обработка изменения положения карусели свайпом
  void _onPageChanged() {
    currentPageIndex = pageController.page?.round() ?? currentPageIndex;
    currentFrontImageController.sink.add(currentPageIndex);
  }

  /// Обработка перемещения к элементу карусели с индексом [index] по нажатию
  void onCarouselItemTap(int index) => pageController.animateToPage(
        index,
        duration: _defaultAnimDuration,
        curve: Curves.easeIn,
      );

  /// Получить индекс изображения  [image] из списка всех изображений [images]
  int _currentPageIndex(ImageModel image) => images.toList().indexOf(image);

  /// Список доступных изображений  из глобального остейта
  @override
  List<ImageModel> get images => appState.images ?? [];
}
