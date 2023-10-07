import 'package:task_283805/enums/message_types_enum.dart';

/// Миксин с методами запуска массажных программ
mixin SmartToolsMixin {
  /// Значение продолжительности массажа
  Duration workingTimer = Duration();

  /// Значение интенсивности массажа
  MessageTypesEnum selectedMassageType = MessageTypesEnum.none;

  /// Запуск программы массажа по текущим параметрам [workingTimer] и [selectedMassageType]
  void startMassage() {
    // Здесь реализация метода запуска массажа и работа с таймером и типом массажа
  }

  /// Установка нового значения [timer] в поле [workingTimer]
  void setTimer(Duration timer) {
    // Здесь реализация метода установки значения таймера
  }

  /// Установка нового значения [type] в поле [selectedMassageType]
  void setProgram(MessageTypesEnum type) {
    // Здесь реализация метода установки типа массажа
  }
}
