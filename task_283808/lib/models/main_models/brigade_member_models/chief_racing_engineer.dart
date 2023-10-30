import '../abstract_models/models.dart';

/// Объект главного гоночного инженера
class ChiefRacingEngineer extends Director {
  ChiefRacingEngineer({
    required super.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
