import 'package:flutter/material.dart';

/// Глобальный ключ навигации приложения
class AppNavigatorKey {
  /// Ключ текущего состояния приложения, для доступа к контексту не из дерева виджетов.
  static final stateKey = GlobalKey<NavigatorState>();
}
