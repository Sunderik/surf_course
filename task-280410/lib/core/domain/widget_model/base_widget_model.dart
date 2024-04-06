import 'package:flutter/widgets.dart';
import 'package:task_280410/core/domain/models/image_model.dart';

/// Базовый объект бизнес-логики для окна
abstract class BaseWidgetModel {
  ///Метод инициализации модели бизнес логики окна,вызывается  через провайдер в дереве виджитов при построении ветви дерева.
  @mustCallSuper
  void init();

  /// Метод закрытия модели бизнес логики окна,вызывается через провайдер в дереве виджитов  при стирании ветви дерева
  @mustCallSuper
  void dispose();

  /// Доступные для просмотра изображения
  List<ImageModel>? get images;
}
