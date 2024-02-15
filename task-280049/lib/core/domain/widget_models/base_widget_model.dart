import 'package:flutter/widgets.dart';

/// Базовый объект бизнес-логики для окна
abstract class BaseWidgetModel {
  ///Метод инициализации модели бизнес логики окна,вызывается  через провайдер в дереве виджитов при построении ветви дерева.
  @mustCallSuper
  void init() {}

  ///Метод закрытия модели бизнес логики окна,вызывается при через провайдер в дереве виджитов  при стирании ветви дерева
  @mustCallSuper
  void dispose() {}
}
