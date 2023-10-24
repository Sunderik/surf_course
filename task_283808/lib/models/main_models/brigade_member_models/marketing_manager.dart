import '../abstract_models/models.dart';
///
class MarketingManager extends Support {
  ///
  List<String> mainMarketingStrategy;

  MarketingManager({
    required this.mainMarketingStrategy,
    required super.education,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
  });
}
