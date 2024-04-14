import 'package:flutter/material.dart';
import 'package:task_285473/core/constants/colors_constants.dart';

/// Расширение для темы приподнятых кнопок
extension ElevatedButtonsExtension on ElevatedButtonThemeData {
  /// Тема основной приподнятой кнопки
  ElevatedButtonThemeData get mainButton => ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorsConstants.appDisabled;
            }
            return ColorsConstants.appActive; // Use the component's default.
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorsConstants.appBackground;
            }
            return Colors.white; // Use the component's default.
          },
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ));
}

/// Расширение для темы приподнятых кнопок
extension CheckboxExtension on CheckboxThemeData {
  /// Тема основной приподнятой кнопки
  static CheckboxThemeData get mainCheckbox => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return ColorsConstants.appActive;
            }
            return Colors.white; // Use the component's default.
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      );
}
