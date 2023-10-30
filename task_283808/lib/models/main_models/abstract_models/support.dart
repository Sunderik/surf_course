import 'member_of_brigade.dart';

/// Объект офисного работника
abstract class Support extends MemberOfBrigade {
  /// Образование
  String education;

  /// Присущие качества
  List<String>? characteristics;

  Support({
    required this.education,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.characteristics,
    super.salary,
    super.uniform,
  });

  @override
  String getBaseInfo() {
    StringBuffer buffer = StringBuffer();

    buffer.write(super.getBaseInfo());
    buffer.writeln('');
    buffer.writeln('Обучался в $education.');

    if (characteristics?.isNotEmpty ?? false) {
      buffer.writeln('Обладает следующими качествами:');
      for (var property in characteristics!) {
        buffer.writeln('\t $property');
      }
    }

    return buffer.toString();
  }
}
