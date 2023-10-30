import '../abstract_models/models.dart';

/// Объект радио-техника
class RadioTechnician extends Technician {
  ///Перечень доступных радио-инструментов
  List<String>? radioTools;

  RadioTechnician({
    required super.category,
    required super.card,
    required super.brigade,
    required super.name,
    required super.surname,
    required super.gender,
    required super.dateOfBirth,
    this.radioTools,
  });
}
