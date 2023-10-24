/// Перечисление доступных полов
enum GendersEnum {
  none('Не указано'),
  male('Мужчина'),
  female('Женщина'),
  indefinite('Не определено');

  const GendersEnum(this.translate);

  ///
  final String translate;
}
