import '../abstract_models/models.dart';

/// Объект спортивного директора
class SportDirector extends Director {
  SportDirector({
    required super.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
