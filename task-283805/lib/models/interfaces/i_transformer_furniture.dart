import 'package:task_283805/models/models.dart';

/// Интерфейс мебели изменяющий свои габариты
abstract class ITransformerFurniture extends Furniture {
  ITransformerFurniture(super.name, super.description, super.size,
      {required super.guid,
      required super.materials,
      required super.features,
      required super.weight,
      required super.legsCount});

  /// Изменить высоту на новую
  Size changeHeight(double newHeight);
}
