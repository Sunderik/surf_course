/// Базовая модель предоставляющая базовые поля для всех других моделей.
abstract class BaseModel {
  /// Идентификатор
  final String guid;

  /// Наименование
  String _name;

  /// Описание
  String description;

  BaseModel(this._name, this.description, {required this.guid}) : assert(guid.isNotEmpty && _name.isNotEmpty);

  /// Свойство возвращающие [_name]
  String get name => _name;

  /// Свойство устанавливающее [_name]
  set name(String val) => {
        if (val.trim().isNotEmpty) {_name = val}
      };
}
