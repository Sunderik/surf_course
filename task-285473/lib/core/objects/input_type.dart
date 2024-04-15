import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_285473/core/constants/strings_constants.dart';
import 'package:task_285473/core/utils/string_utils.dart';

/// Тип функции для валидации данных, где [value] - значение, которое проверяется.
typedef ValidationFunc = String? Function(String? value);

/// Тип функции для обработки нажатия на поле вода
typedef OnTapFunc = Future<void> Function(BuildContext context, TextEditingController controller);

/// Базовый класс типа ввода данных
sealed class InputType {
  /// Валидатор данных
  final ValidationFunc validator;

  /// Базовое сообщение об ошибке валидации
  final String errorMsg;

  /// Форматировщики для поля ввода данных
  final List<TextInputFormatter>? formatters;

  /// Тип используемой клавиатуры
  final TextInputType keyboardType;

  /// Обработчик нажатия на поле ввода данных
  final OnTapFunc? onTapFunc;

  InputType({
    required this.validator,
    required this.errorMsg,
    required this.keyboardType,
    required this.formatters,
    this.onTapFunc,
  });
}

/// Класс типа ввода текстовых данных
class TextType implements InputType {
  @override
  String get errorMsg => StringsConstants.nameInputError;

  @override
  List<TextInputFormatter>? get formatters => null;

  @override
  TextInputType get keyboardType => TextInputType.name;

  @override
  ValidationFunc get validator => _textValidator;

  @override
  OnTapFunc? get onTapFunc => null;

  /// Валидатор текстовых данных
  String? _textValidator(String? val) {
    if (val == null || val.isEmpty) {
      return errorMsg;
    }
    if (val.length < 3 || val.length > 20) {
      return errorMsg;
    }
    return null;
  }
}

/// Класс типа ввода целочисленных данных
class IntegerType implements InputType {
  @override
  String get errorMsg => StringsConstants.weightInputError;

  @override
  List<TextInputFormatter>? get formatters => [FilteringTextInputFormatter.digitsOnly];

  @override
  TextInputType get keyboardType => TextInputType.number;

  @override
  ValidationFunc get validator => _integerValidator;

  @override
  OnTapFunc? get onTapFunc => null;

  /// Валидатор целочисленных данных
  String? _integerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return errorMsg;
    }
    if (int.parse(val) < 1) {
      return errorMsg;
    }
    return null;
  }
}

/// Класс типа ввода временных данных
class DateType implements InputType {
  @override
  String get errorMsg => StringsConstants.birthdayInputError;

  @override
  List<TextInputFormatter>? get formatters => [FilteringTextInputFormatter.digitsOnly];

  @override
  TextInputType get keyboardType => TextInputType.none;

  @override
  ValidationFunc get validator => _dateValidator;

  @override
  OnTapFunc get onTapFunc => _openDatePicker;

  Future<void> _openDatePicker(BuildContext context, TextEditingController controller) async {
    DateTime initDate = DateTime.now();
    if (controller.text.isNotEmpty) {
      initDate = StringUtils.dateReformat(controller.text);
    }
    final newDate = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (newDate != null) {
      controller.text = StringUtils.dateFormat(newDate);
    }
  }

  /// Валидатор временных данных
  String? _dateValidator(String? val) {
    if (val == null || val.isEmpty) {
      return errorMsg;
    }
    if (StringUtils.dateReformat(val).isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
      return errorMsg;
    }
    return null;
  }
}

/// Класс типа ввода почты
class EmailType implements InputType {
  @override
  String get errorMsg => StringsConstants.emailInputHint;

  @override
  List<TextInputFormatter>? get formatters => null;

  @override
  TextInputType get keyboardType => TextInputType.emailAddress;

  @override
  ValidationFunc get validator => _emailValidator;

  @override
  OnTapFunc? get onTapFunc => null;

  /// Валидатор ввода почты
  String? _emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return errorMsg;
    }
    if (!StringUtils.emailFormat.hasMatch(val)) {
      return errorMsg;
    }
    return null;
  }
}
