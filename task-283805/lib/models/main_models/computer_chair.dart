import 'package:task_283805/models/models.dart';

/// Объект компьютерного стула
class ComputerChair extends Chair implements ITransformerFurniture {
  final int pillowsCount;

  ComputerChair(
    super.name,
    super.description,
    super.size,
    super.backrestTilt,
    this.pillowsCount, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
  });

  void changeBackrestTilt(double agile) {
    backrestTilt = agile;
  }

  @override
  Size changeHeight(double newHeight) {
    size = Size(height: newHeight, width: size.width, depth: size.depth);
    return size;
  }
}
