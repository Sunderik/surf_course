import 'package:task_283808/enums/access_levels_enum.dart';

/// Пропуск
class PassCard {
  /// Идентификатор
  String id;

  /// Присвоенные уровни доступа
  Set<AccessLevelsEnum> accessLevels;

  PassCard({
    required this.id,
    this.accessLevels = const {},
  });

  /// Возвращает ифномрацию о пропуске
  String getAccessesInfo() {
    StringBuffer buffer = StringBuffer();

    buffer.writeln('Пропуск {$id}:');
    buffer.writeln(_getAccessesLevelsInfo());

    return buffer.toString();
  }

  /// Возвращает перечень доступных разрешений
  String _getAccessesLevelsInfo() {
    StringBuffer buffer = StringBuffer();

    if (accessLevels.isEmpty) {
      buffer.write('Активные допуски отсутствуют.');
    } else {
      for (var level in accessLevels) {
        buffer.writeln('\t ${level.toString()}');
      }
    }

    return buffer.toString();
  }
}
