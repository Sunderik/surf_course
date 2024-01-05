import 'package:flutter/foundation.dart';

/// Базовый объект бизнес-логики виджета
abstract class BaseBloc {
  ///Метод инициализации блока,вызывается  через провайдер в дереве виджитов при построении ветви дерева.
  @mustCallSuper
  void init() {}

  ///Метод закрытия блока, вызывается через провайдер в дереве виджитов при стирании ветви дерева
  @mustCallSuper
  void dispose() {}
}
