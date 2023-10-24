import '../../lib.dart';

/// Бригада Формулы 1
class Brigade {
  /// Название
  String name;

  /// Страна за которую выступает
  CountryEnum country;

  /// Цвета бригады в Hex формате
  List<String> colorsInHEX;

  /// Спонсоры
  List<Sponsor> sponsors;

  /// Болиды принадлежащие бригаде
  List<Car> cars;

  /// Состав бригады
  List<MemberOfBrigade> team;

  Brigade({
    required this.name,
    required this.country,
    this.colorsInHEX = const [],
    this.sponsors = const [],
    this.cars = const [],
    this.team = const [],
  });
}
