import 'package:flutter/widgets.dart';

/// Расширение для темы иконок
extension IconsExtension on IconThemeData {
  /// Тема для иконок заголовка страницы
  IconThemeData get appBarIconTheme => const IconThemeData(size: 19);
}
