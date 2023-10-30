import '../abstract_models/models.dart';

/// Объект менеджера по продажам
class MarketingManager extends Support {
  /// Используемые маркетинговые стратегии
  List<String> usedMarketingStrategies;

  MarketingManager(
      {this.usedMarketingStrategies = const [],
      required super.education,
      required super.card,
      required super.brigade,
      required super.name,
      required super.surname,
      required super.gender,
      required super.dateOfBirth,
      super.characteristics,
      super.salary,
      super.uniform});

  @override
  String getBaseInfo() {
    StringBuffer buffer = StringBuffer();

    buffer.write(super.getBaseInfo());
    buffer.writeln('');
    buffer.writeln('Роль: Менеджер по маркетингу.');

    if (usedMarketingStrategies.isNotEmpty) {
      buffer.writeln('Использует стратегии:');
      for (var strategy in usedMarketingStrategies) {
        buffer.writeln('\t $strategy');
      }
    } else {
      buffer.writeln('Не использует стратегий.');
    }

    return buffer.toString();
  }
}
