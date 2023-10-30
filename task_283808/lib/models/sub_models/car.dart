import '../../lib.dart';

/// Болид Формулы 1
class Car {
  /// Идентификационный номер
  String id;

  /// Регистрационный номер
  int number;

  /// Пилот болида
  Pilot pilot;

  /// Марка болида
  CarMarksEnum mark;

  Car({
    required this.id,
    required this.number,
    required this.pilot,
    required this.mark,
  });
}
