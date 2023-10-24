import '../abstract_models/models.dart';

///
class CarEngineer extends GarageWorker {
  ///
  List<String>? softwares;

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
    this.softwares,
  });
}
