import 'package:task_283805/models/models.dart';

/// Объект компьютерного стола
class ComputerTable extends Table implements ITransformerFurniture {
  ComputerTable(
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

  @override
  Size changeHeight(double newHeight) {
    size = Size(height: newHeight, width: size.width, depth: size.depth);
    return size;
  }
}
