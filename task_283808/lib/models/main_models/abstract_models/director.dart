import 'package:task_283808/lib.dart';

/// Объект управленца
abstract class Director extends MemberOfBrigade {
  /// Используемая стратегия
  StrategiesEnum strategy;

  /// Сфера ответственности
  String? responsibilityScope;

  Director({
    required this.strategy,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.responsibilityScope,
    super.salary,
    super.uniform,
  });
}
