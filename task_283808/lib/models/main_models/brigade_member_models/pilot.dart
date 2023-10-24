import 'package:task_283808/lib.dart';

/// Объект пилота болида Формулы 1
class Pilot extends MemberOfBrigade {
  /// Количество персональных побед
  int personalWindsNumber;

  /// Страна рождения
  CountryEnum birthCountry;

  Pilot({
    required this.birthCountry,
    this.personalWindsNumber = 0,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
