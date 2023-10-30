import '../abstract_models/models.dart';

/// Объект инженера по стратегиям.
class StrategyEngineer extends Director {
  StrategyEngineer({
    required super.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
