import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/library/widgets/copied_icon.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen_widget_model.dart';
import 'package:task_280049/features/color_details_screen/widgets/neomorphism_data_container.dart';

/// Тип функции для копирования значения канала цвета
typedef CopyChannelValue = void Function(BuildContext context, int value);

/// Тип функции для копирования значения hex цвета
typedef CopyHexValue = Future<void> Function(ColorEntity value);

/// Виджет информации о цвете
class ColorData extends StatelessWidget {
  /// Информации о цвете
  const ColorData({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);
    final theme = Theme.of(context);
    final color = widgetModel.color;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                color.name,
                style: theme.textTheme.customTitle,
              ),
            ],
          ),
          if (color.value.isNotEmpty) ...[
            _ColorHex(name: 'HEX', color: color, onTapFunc: widgetModel.copyColorToClipboard),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ColorChannel(
                      name: 'Red', value: color.getColor().red, onTapFunc: widgetModel.copyChannelToClipboard),
                  _ColorChannel(
                      name: 'Green', value: color.getColor().green, onTapFunc: widgetModel.copyChannelToClipboard),
                  _ColorChannel(
                      name: 'Blue', value: color.getColor().blue, onTapFunc: widgetModel.copyChannelToClipboard),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Виджет информации о значение цвета
class _ColorHex extends StatelessWidget {
  /// Название
  final String name;

  /// Значение
  final ColorEntity color;

  /// Функция для копирования в системный буфер
  final CopyHexValue onTapFunc;

  ///Информации о канале цвета
  const _ColorHex({
    required this.name,
    required this.color,
    required this.onTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);
    final theme = Theme.of(context);
    final color = widgetModel.color;

    return GestureDetector(
      onTap: () => onTapFunc(color),
      child: NeomorphDataContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HEX',
              style: theme.textTheme.customText,
            ),
            Row(
              children: [
                Text(
                  color.value.substring(1),
                  style: theme.textTheme.customText,
                ),
                CopiedIconWidget(targetColor: color, colorStream: widgetModel.hexInClipboardStream),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Виджет информации о канале
class _ColorChannel extends StatelessWidget {
  /// Название
  final String name;

  /// Значение
  final int value;

  /// Функция для копирования в системный буфер
  final CopyChannelValue onTapFunc;

  ///Информации о канале цвета
  const _ColorChannel({
    required this.name,
    required this.value,
    required this.onTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTapFunc(context, value),
      child: NeomorphDataContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: theme.textTheme.customText,
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                Text(value.toString(), style: theme.textTheme.customText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
