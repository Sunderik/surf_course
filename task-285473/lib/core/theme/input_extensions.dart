import 'package:flutter/material.dart';
import 'package:task_285473/core/constants/colors_constants.dart';
import 'package:task_285473/core/theme/text_extension.dart';

const double _radius = 12;

/// Расширение для темы поля ввода
extension InputDecorationExtension on InputDecorationTheme {
  /// Базовая тема поля вода в приложении
  static InputDecorationTheme get baseTheme => InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(_radius),
        ),
        border: UnderlineInputBorder(
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(_radius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 0, color: ColorsConstants.appBackground),
          borderRadius: BorderRadius.circular(_radius),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 0, color: ColorsConstants.appBackground),
          borderRadius: BorderRadius.circular(_radius),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 0, color: ColorsConstants.appBackground),
          borderRadius: BorderRadius.circular(_radius),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 0, color: ColorsConstants.appDisabled),
          borderRadius: BorderRadius.circular(_radius),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: CustomTextTheme.inputTitle,
        labelStyle: CustomTextTheme.inputHint,
        errorStyle: CustomTextTheme.inputTransparentError,
        errorMaxLines: 1,
        isDense: true,
      ); // Us
}
