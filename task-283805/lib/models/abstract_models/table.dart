import 'package:task_283805/models/abstract_models/furniture.dart';

/// Абстракция объекта стол
abstract class Table extends Furniture {
  /// Количество ящиков в столе
  final int boxCount;

  Table(
    super.name,
    super.description,
    super.size, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
    required this.boxCount,
  }) : assert(boxCount >= 0);
}
