import 'package:task_283808/lib.dart';

/// Объект участника бригады
abstract class MemberOfBrigade extends Human {
  /// Карточка доступа
  PassCard card;

  /// Бригада, участником которой является
  Brigade brigade;

  /// Зарплата
  double? salary;

  /// Униформа
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

  @override
  void printDescription() {
    StringBuffer buffer = StringBuffer();

    buffer.writeln(getBaseInfo());

    print(buffer.toString());
  }

  @override
  String getBaseInfo() {
    StringBuffer buffer = StringBuffer();

    buffer.write(super.getBaseInfo());
    buffer.writeln('');
    buffer.writeln('Член бригады:');
    buffer.writeln('Бригада: ${brigade.name}');
    buffer.writeln('Зарплата: ${salary?.toStringAsFixed(2) ?? 0} рублей.');
    buffer.writeln('Ходит в $uniform');
    buffer.writeln(card.getAccessesInfo());

    return buffer.toString();
  }
}
