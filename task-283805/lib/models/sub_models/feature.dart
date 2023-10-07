import 'package:task_283805/models/abstract_models/base_model.dart';

/// Тип действий производимых с конструктивными особенностями мебели.
typedef UseFeatureFunction = void Function();

/// Объект дополнительной конструктивной особенности мебели
class Feature extends BaseModel {
  /// Стоимость  особенности
  double _cost;

  /// Действие происходящее при использовании данной конструктивной особенности мебели.
  UseFeatureFunction use;

  Feature(super.name, super.description, this._cost, {required super.guid, required this.use});

  /// Свойство возвращающие стоимость конструктивной особенности мебели [_cost].
  double get cost => _cost;

  /// Свойство устанавливающее стоимость конструктивной особенности мебели [_cost], с проверкой на отрицательное значение
  set cost(double val) => {
        if (val > 0.0) {_cost = val}
      };
}
