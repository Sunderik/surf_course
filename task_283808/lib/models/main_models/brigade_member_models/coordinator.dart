import '../abstract_models/models.dart';

/// Объект координатора
class Coordinator extends Support {
  /// Перечень актуальных задач для координации
  List<String> actualTasks;

  Coordinator({
    required this.actualTasks,
    required super.education,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
