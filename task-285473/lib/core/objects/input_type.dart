import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_285473/core/constants/strings_constants.dart';
import 'package:task_285473/core/utils/string_utils.dart';

typedef ValidationFunc = String? Function(String? value);
typedef onTapFunc = Future<void> Function(BuildContext context, TextEditingController controller);

///
sealed class InputType {
  ///
  final ValidationFunc validator;

  ///
  final String errorMsg;

  ///
  final List<TextInputFormatter>? formatters;

  ///
  final TextInputType keyboardType;

  ///
  final onTapFunc? onFocusFunc;

  InputType({
    required this.validator,
    required this.errorMsg,
    required this.keyboardType,
    required this.formatters,
    this.onFocusFunc,
  });
}

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
  onTapFunc? get onFocusFunc => null;

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

class NumberType implements InputType {
  @override
  String get errorMsg => StringsConstants.weightInputError;

  @override
  List<TextInputFormatter>? get formatters => [FilteringTextInputFormatter.digitsOnly];

  @override
  TextInputType get keyboardType => TextInputType.number;

  @override
  ValidationFunc get validator => _numberValidator;

  @override
  onTapFunc? get onFocusFunc => null;

  String? _numberValidator(String? val) {
    if (val == null || val.isEmpty) {
      return errorMsg;
    }
    if (int.parse(val) < 1) {
      return errorMsg;
    }
    return null;
  }
}

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
  onTapFunc get onFocusFunc => _openDatePicker;

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
  onTapFunc? get onFocusFunc => null;

  String? _emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return errorMsg;
    }
    if (!StringUtils.email.hasMatch(val)) {
      return errorMsg;
    }
    return null;
  }
}
