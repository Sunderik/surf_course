import '../abstract_models/models.dart';

/// Объект машинного инженера
class CarEngineer extends GarageWorker {
  /// Перечень доступных программных инструментов
  List<String>? softwareTools;

  CarEngineer({
    required super.garagePlace,
    required super.responsibilityArea,
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.softwareTools,
  });
}
