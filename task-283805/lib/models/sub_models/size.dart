/// Объект размеров
class Size {
  /// Высота в мм
  final double height;

  /// Ширина в мм
  final double width;

  /// Глубина в мм
  final double depth;

  Size({required this.height, required this.width, required this.depth})
      : assert(height > 0.0),
        assert(width > 0.0),
        assert(depth > 0.0);

  /// Получение габаритов
  String get dimensions => '$height x $width x $depth';
}
