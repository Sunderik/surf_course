/// Перечисление уровней доступа
enum AccessLevelsEnum {
  racingCar('Болид', 'Красный'),
  pitStopZone('Зона пит стопа', 'Оранжевый'),
  garage('Гараж', 'Желтый'),
  headquarters('Штаб', 'Зеленый'),
  commandBridge('Мостик', 'Фиолетовый'),
  teamTrucks('Трак', 'Синий');

  const AccessLevelsEnum(
    this.translate,
    this.color,
  );

  /// Перевод
  final String translate;

  /// Цвет уровня доступа
  final String color;

  /// Вывод описания уровня доступа строкой.
  @override
  String toString() {
    return 'Уровень $index [$color]: с доступом к $translate';
  }
}
