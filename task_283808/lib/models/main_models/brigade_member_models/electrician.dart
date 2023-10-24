import '../abstract_models/models.dart';

///
class Electrician extends Technician {
  ///
  List<String>? electricTools;

  Electrician({
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.electricTools,
  });
}
