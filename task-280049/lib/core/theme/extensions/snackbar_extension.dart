import 'package:flutter/material.dart';
import 'package:task_280049/core/logic/keys/keys.dart';
import 'package:task_280049/core/theme/extensions/color_extension.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';

/// Расширение для
extension CustomSnackBarTheme on SnackBarThemeData {
  /// Тема для отображения иконки в выбранном состоянии
  SnackBarThemeData get copyBufferSnackBar {
    final context = AppNavigatorKey.stateKey.currentContext;
    if (context != null) {
      final theme = Theme.of(context);
      return SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: theme.colorScheme.customOpacity,
          contentTextStyle: theme.textTheme.customTextWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          width: 160);
    } else {
      return const SnackBarThemeData();
    }
  }
}
