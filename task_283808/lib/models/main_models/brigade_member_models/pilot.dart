import '../../../lib.dart';
///
class Pilot extends MemberOfBrigade {
  ///
  int personalWindsNumber;
  ///
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
