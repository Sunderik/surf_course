import '../abstract_models/models.dart';

/// Объект машинного механика
class CarMechanic extends GarageWorker {
  /// Перечень доступных механизированных инструментов
  String? mechanizedTool;

  CarMechanic({
    required super.garagePlace,
    required super.responsibilityArea,
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
