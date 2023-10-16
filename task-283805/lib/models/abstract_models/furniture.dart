import 'package:task_283805/models/models.dart';

/// Описательный объект мебели
abstract class Furniture extends BaseModel {
  /// Список материалов из которого изготовлена мебель
  final List<Material> materials;

  /// Список особенностей которые в конструкции мебели
  final List<Feature> features;

  /// Габариты мебели
  // ignore: prefer_final_fields
  Size size;

  /// Вес мебели в Кг
  final double weight;

  /// Количество ножек у мебели
  final int legsCount;

  Furniture(
    super.name,
    super.description,
    this.size, {
    required super.guid,
    required this.materials,
    required this.features,
    required this.weight,
    required this.legsCount,
  })  : assert(materials.isNotEmpty),
        assert(features.isNotEmpty),
        assert(weight > 0.0),
        assert(legsCount >= 0);

  /// Возвращает общую стоимость мебели на основе материалов и особенностей
  double getTotalCost() {
    double totalMaterialsCost = 0.0;
    double totalFeaturesCost = 0.0;

    for (var e in materials) {
      totalMaterialsCost + e.cost;
    }
    for (var e in features) {
      totalMaterialsCost + e.cost;
    }

    return totalMaterialsCost + totalFeaturesCost;
  }
}
