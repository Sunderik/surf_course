import 'package:task_283808/lib.dart';

///
abstract class Technician extends MemberOfBrigade {
  ///
  CategoriesEnum category;

  ///
  int workExperienceInYear;

  ///
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
  });
}
