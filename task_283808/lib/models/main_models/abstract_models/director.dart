import 'package:task_283808/lib.dart';

///
abstract class Director extends MemberOfBrigade {
  ///
  StrategiesEnum strategy;

  ///
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
  });
}
