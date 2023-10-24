import '../abstract_models/models.dart';

/// Объект генерального менеджера
class GeneralManager extends Director {
  GeneralManager({
    required super.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
