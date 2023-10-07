import 'package:task_283805/models/models.dart';

/// Объект фирмы производителя
class Company extends BaseModel {
  /// Страна регистрации фирмы производителя, не может быть изменена
  final String registrationCountry;

  /// Адрес регистрации фирмы производителя
  String _address;

  /// Электронная почта фирмы производителя
  String? _email;

  Company(
    super.name,
    super.description,
    this._address, {
    required super.guid,
    required this.registrationCountry,
  }) : assert(registrationCountry.isNotEmpty && _address.isNotEmpty);

  /// Свойство возвращающие ***полный*** адрес фирмы производителя
  String get address => '$registrationCountry, $_address';

  /// Свойство устанавливающее [_address], нельзя установить пустое значение
  set address(String val) => {
        if (val.trim().isNotEmpty) {_address = val}
      };

  /// Свойство возвращающие [_address] - эл. почту фирмы производителя
  String get email => _email ?? 'Эл. почта отсутствует.';

  /// Свойство устанавливающее  [_address] - эл. почту фиры производителя, с проверкой на корректность написания.
  set email(String val) => {
        if (val.trim().isNotEmpty && val.contains('@') && val.contains('.')) {email = val}
      };
}
