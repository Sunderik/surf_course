import '../abstract_models/models.dart';
///
class RadioTechnician extends Technician {
  ///
  List<String>? radioTools;

  RadioTechnician({
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.radioTools,
  });
}
