import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/library/widgets/copied_icon.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';
import 'package:task_280049/features/colors_screen/colors_screen_widget_model.dart';

/// Виджет плитки цвета
class ColorTile extends StatelessWidget {
  /// Цвет для отображения в плитке
  final ColorEntity color;

  /// Плитка с цветом
  const ColorTile({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorsScreenWidgetModel>(context, listen: false);
    final theme = Theme.of(context);
    final colorCode = color.getColor().value;

    return GestureDetector(
      onTap: () => widgetModel.navigateToColorPage(context, color),
      onLongPress: () => widgetModel.copyColorToClipboard(color),
      child: FittedBox(
        child: SizedBox(
          height: 140,
          width: 100,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: SizedBox.square(
                dimension: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(colorCode),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(color.name, style: theme.textTheme.customCaption),
                  ],
                ),
                Row(
                  children: [
                    Text(color.value, style: theme.textTheme.customCaption),
                    CopiedIconWidget(targetColor: color, colorStream: widgetModel.hexInClipboardStream),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
