import '../abstract_models/models.dart';

/// Объект электрика
class Electrician extends Technician {
  /// Перечень доступных электроинструментов
  List<String>? electricTools;

  Electrician({
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.electricTools,
  });
}
