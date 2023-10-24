import 'package:task_283808/lib.dart';

///
class Human {
  ///
  String name;

  ///
  String surname;

  ///
  GendersEnum gender;

  ///
  DateTime dateOfBirth;

  Human({required this.name, required this.surname, required this.gender, required this.dateOfBirth});

  ///
  void getDescription() {
    print('Здесь выводится описание человека на основе его параметров.');
  }
}
