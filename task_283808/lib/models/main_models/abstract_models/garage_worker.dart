import 'technician.dart';

/// Объект работника гаража
abstract class GarageWorker extends Technician {
  /// Рабочее место в гараже
  String garagePlace;

  /// Зона ответственности
  String responsibilityArea;

  GarageWorker({
    required this.garagePlace,
    required this.responsibilityArea,
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    super.tools,
  });
}
