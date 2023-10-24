import 'member_of_brigade.dart';

///
abstract class Support extends MemberOfBrigade {
  ///
  String education;

  ///
  List<String>? competencies;

  Support({
    required this.education,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.competencies,
  });
}
