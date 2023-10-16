import 'package:task_283805/models/models.dart';

/// Объект материала из которого изготавливают мебель
class Material extends BaseModel {
  /// Стоимость материала в рублях в данной объекте
  double _cost;

  /// Компания изготовитель материала
  Company manufacturer;

  Material(
    super.name,
    super.description,
    this._cost, {
    required super.guid,
    required this.manufacturer,
  }) : assert(_cost > 0.0);

  /// Свойство возвращающие стоимость материала [_cost].
  double get cost => _cost;

  /// Свойство устанавливающее стоимость материала [_cost], с проверкой на отрицательное значение
  set cost(double val) => {
        if (val > 0.0) {_cost = val}
      };
}
