import 'package:flutter/material.dart';
import 'package:task_280049/core/theme/extensions/color_extension.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';

class NeomorphDataContainer extends StatelessWidget {
  final Widget child;

  const NeomorphDataContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = BorderRadius.circular(16);

    return Material(
      color: theme.colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      textStyle: theme.textTheme.customText,
      elevation: 15,
      shadowColor: theme.colorScheme.customShadow,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
