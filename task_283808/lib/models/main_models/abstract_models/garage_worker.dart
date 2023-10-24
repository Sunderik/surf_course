import 'technician.dart';

///
abstract class GarageWorker extends Technician {
  ///
  String garagePlace;

  ///
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
  });
}
