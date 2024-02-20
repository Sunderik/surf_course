import 'package:flutter/material.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/theme/extensions/color_extension.dart';

/// Виджет отображения иконки скопированного цвета
class CopiedIconWidget extends StatelessWidget {
  /// Целевой цвет для сравнения с полученным из потока скопированного цвета
  final ColorEntity targetColor;

  /// Поток скопированного цвета
  final Stream<ColorEntity> colorStream;

  /// Иконка скопированного цвета
  const CopiedIconWidget({super.key, required this.targetColor, required this.colorStream});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: StreamBuilder<ColorEntity?>(
          stream: colorStream,
          builder: (context, snapshot) {
            final isCopied = snapshot.data == targetColor;
            if (isCopied) {
              return Icon(
                Icons.copy_sharp,
                color: Theme.of(context).colorScheme.customIcons,
                size: 14,
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
