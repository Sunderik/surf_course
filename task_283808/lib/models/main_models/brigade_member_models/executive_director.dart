import '../abstract_models/models.dart';

/// Объект исполнительного директора
class ExecutiveDirector extends Director {
  ExecutiveDirector({
    required super.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
