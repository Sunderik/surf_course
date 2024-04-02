import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/library/change_theme_bottom_sheet/change_theme_bottom_sheet_model_view.dart';
import 'package:task_280398/core/library/circle_painter.dart';
import 'package:task_280398/core/library/custom_scheme_radio_button.dart';
import 'package:task_280398/core/theme/text_extension.dart';

/// Тип функции обработчика нажатия на схему
typedef OnSchemeTap = void Function(AppTheme scheme);

/// Ради кнопка (кастомная) типа темы приложения
class CustomRadioButton extends StatelessWidget {
  /// Данная кнопка выбрана
  final bool isSelected;

  /// Название кнопки
  final String name;

  /// Функция обработки нажатия на кнопку типа темы
  final VoidCallback onThemeTypeTap;

  /// Функция обработки нажатия на кнопку схемы
  final OnSchemeTap onSchemeTap;

  /// Схемы относящиеся к данной кнопке
  final Set<AppTheme>? schemas;

  const CustomRadioButton({
    super.key,
    this.isSelected = false,
    required this.name,
    required this.onThemeTypeTap,
    required this.onSchemeTap,
    this.schemas,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheetWM = Provider.of<ChangeThemeBottomSheetWidgetModel>(context, listen: false);
    final theme = Theme.of(context);
    final schemes = schemas;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 56,
          child: GestureDetector(
            onTap: onThemeTypeTap,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                _RadioButtonCircle(isSelected: isSelected),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      name,
                      style: theme.textTheme.customButton.copyWith(color: theme.colorScheme.tertiary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            child: isSelected && schemes != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: schemes
                        .map((e) => CustomSchemeRadioButton(
                              isSelected: e == bottomSheetWM.selectedTheme,
                              schema: e,
                              name: '${StringsConstants.scheme} ${e.number}',
                              callback: () => onSchemeTap(e),
                            ))
                        .toList(),
                  )
                : const SizedBox.shrink()),
      ],
    );
  }
}

/// Индикатор радио кнопки
class _RadioButtonCircle extends StatelessWidget {
  /// Признак того что индикатор отображается как активный
  final bool isSelected;

  /// Размер индикатора (по умолчанию 20)
  final double size;

  const _RadioButtonCircle({this.isSelected = false, this.size = 20});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(alignment: Alignment.center, children: [
        CustomPaint(
          painter: CirclePainter(color: colorScheme.primary, isFill: isSelected),
          child: Container(),
        ),
        if (isSelected)
          SizedBox(
            width: size / 2.5,
            height: size / 2.5,
            child: CustomPaint(
              painter: CirclePainter(color: colorScheme.surface),
              child: Container(),
            ),
          ),
      ]),
    );
  }
}
