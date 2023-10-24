import '../abstract_models/models.dart';

///
class HR extends Support {
  ///
  List<String> vacancies;

  ///
  List<String> cvs;

  HR({
    required this.vacancies,
    required this.cvs,
    required super.education,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
