import '../abstract_models/models.dart';

/// Объект главы бригады
class HeadOfTeam extends Director {
  HeadOfTeam({
    required super.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
