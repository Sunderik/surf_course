import 'package:task_283805/models/models.dart';

/// Объект обычного стола
class Desk extends Table {
  Desk(
    super.name,
    super.description,
    super.size, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
    required super.boxCount,
  });
}
