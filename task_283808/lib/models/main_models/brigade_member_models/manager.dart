import '../abstract_models/models.dart';

/// Объект менеджера
class Manager extends Support {
  /// Перечень актуальных проблем, требующих решения
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
