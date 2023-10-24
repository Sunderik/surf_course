import '../abstract_models/models.dart';

/// Объект сотрудника отдела кадров
class HR extends Support {
  /// Перечень доступных вакансий
  List<String> vacancies;

  /// Перечень доступных резюме
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
