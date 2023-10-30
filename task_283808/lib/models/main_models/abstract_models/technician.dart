import 'package:task_283808/lib.dart';

/// Объекта техника
abstract class Technician extends MemberOfBrigade {
  /// Категория (разряд)
  CategoriesEnum category;

  /// Стаж работы
  int workExperienceInYear;

  /// Используемы инструменты
  Set<ToolsEnum>? tools;

  Technician({
    required this.category,
    this.workExperienceInYear = 0,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.tools,
    super.salary,
    super.uniform,
  });
}
