import 'package:task_283808/lib.dart';

/// Объект человека
class Human {
  /// Имя
  String name;

  /// Фамилия
  String surname;

  /// Пол
  GendersEnum gender;

  /// Дата рождения
  DateTime dateOfBirth;

  Human({required this.name, required this.surname, required this.gender, required this.dateOfBirth});

  /// Вывести описание объекта
  void printDescription() {
    print(getBaseInfo());
  }

  /// Получить описание объекта
  String getBaseInfo() {
    StringBuffer buffer = StringBuffer();

    buffer.writeln('Человек:');
    buffer.writeln('ФИО: $name $surname');
    buffer.writeln('Пол: ${gender.translate}');
    buffer.writeln('Дата рождения: $dateOfBirth');

    return buffer.toString();
  }
}
