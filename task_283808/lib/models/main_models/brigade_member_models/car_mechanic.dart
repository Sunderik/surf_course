import '../abstract_models/models.dart';

///
class CarMechanic extends GarageWorker {
  ///
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
