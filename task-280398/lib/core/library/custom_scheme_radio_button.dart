import 'package:flutter/material.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/library/circle_painter.dart';
import 'package:task_280398/core/theme/text_extension.dart';

/// Кастомная радио кнопка выбора цветовой схемы
class CustomSchemeRadioButton extends StatelessWidget {
  /// Признак что данная тема выбрана
  final bool isSelected;

  /// Название цветовой схемы
  final String name;

  /// Функция обработки нажатия на кнопку
  final VoidCallback callback;

  /// Цветовая схема
  final AppTheme schema;

  const CustomSchemeRadioButton(
      {super.key, this.isSelected = false, required this.name, required this.callback, required this.schema});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        height: 64,
        width: 103,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: theme.colorScheme.onSurface,
            border: Border.all(
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _ColorsPreview(schema: schema),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  name,
                  style: theme.textTheme.customCaption
                      .copyWith(color: isSelected ? theme.colorScheme.tertiary : theme.colorScheme.secondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет цветов цветовой схемы
class _ColorsPreview extends StatelessWidget {
  /// Цветовая схема
  final AppTheme schema;

  const _ColorsPreview({required this.schema});

  @override
  Widget build(BuildContext context) {
    final scheme = schema.getThemeDataByTheme(context).colorScheme;
    return SizedBox(
      width: 18,
      height: 18,
      child: GridView.count(crossAxisSpacing: 4, mainAxisSpacing: 4, crossAxisCount: 2, children: <Widget>[
        _ColorCircle(color: scheme.secondary),
        _ColorCircle(color: scheme.primary),
        _ColorCircle(color: scheme.tertiary),
        _ColorCircle(color: scheme.surface),
      ]),
    );
  }
}

/// Цветной кружок
class _ColorCircle extends StatelessWidget {
  /// Цвет круга
  final Color color;

  const _ColorCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8,
      height: 8,
      child: CustomPaint(
        painter: CirclePainter(color: color, isFill: true),
        child: Container(),
      ),
    );
  }
}
