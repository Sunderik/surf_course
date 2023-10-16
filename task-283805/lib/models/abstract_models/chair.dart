import 'package:task_283805/models/abstract_models/furniture.dart';

/// Абстракция объекта стул
abstract class Chair extends Furniture {
  /// Наклон спинки, может отсутствовать если ее нет в конструкции.
  double? backrestTilt;

  Chair(
    super.name,
    super.description,
    super.size,
    this.backrestTilt, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
  });
}
