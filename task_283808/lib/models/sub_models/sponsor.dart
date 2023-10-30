import 'package:task_283808/lib.dart';

/// Объект спонсора
class Sponsor {
  /// Название
  String name;

  /// Старна регистрации
  CountryEnum country;

  /// Глава фирмы
  Human head;

  /// Перечисленные спонсорские пожертвования бригаде.
  double providedAssistance;

  Sponsor({
    required this.name,
    required this.country,
    required this.head,
    this.providedAssistance = 0.0,
  });
}
