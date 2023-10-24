import 'package:task_283808/lib.dart';

///
abstract class MemberOfBrigade extends Human {
  ///
  PassCard card;

  ///
  Brigade brigade;

  ///
  double? salary;

  ///
  String? uniform;

  MemberOfBrigade({
    required this.card,
    required this.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.salary,
    this.uniform,
  });

  ///
  @override
  void getDescription() {
    print('Здесь выводится описание человека на основе его параметров,а так же его роли в бригаде формулы 1.');
  }
}
