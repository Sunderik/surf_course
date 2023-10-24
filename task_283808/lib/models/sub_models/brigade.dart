import '../../lib.dart';

///
class Brigade {
  ///
  String name;

  ///
  CountryEnum country;

  ///
  List<String> colorsInHEX;

  ///
  List<Sponsor> sponsors;

  ///
  List<Car> cars;

  ///
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
