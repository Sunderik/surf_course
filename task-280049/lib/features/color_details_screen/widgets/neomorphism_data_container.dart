import 'package:flutter/material.dart';
import 'package:task_280049/core/theme/extensions/color_extension.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';

/// Виджет контейнера в стиле неоморфизма, для отображения других виджетов
class NeomorphDataContainer extends StatelessWidget {
  /// Дочерний виджет который нужно обернуть в стилизованный контейнер
  final Widget child;

  /// Контейнера в стиле неоморфизма, для отображения других виджетов
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
