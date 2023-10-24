import '../abstract_models/models.dart';

///
class Manager extends Support {
  ///
  List<String> actualProblems;

  Manager({
    required this.actualProblems,
    required super.education,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
