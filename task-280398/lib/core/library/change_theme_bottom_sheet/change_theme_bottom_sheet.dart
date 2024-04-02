import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/domain/models/app_state_model.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';
import 'package:task_280398/core/library/change_theme_bottom_sheet/change_theme_bottom_sheet_model_view.dart';
import 'package:task_280398/core/library/custom_radio_button.dart';
import 'package:task_280398/core/theme/button_extensions.dart';
import 'package:task_280398/core/theme/text_extension.dart';

/// Модельное окно выбора темы оформления
class ChangeThemeBottomSheet {
  /// Текущий контекст дерева виджитов
  final BuildContext context;

  ChangeThemeBottomSheet({required this.context});

  /// Отобразить модельное окно
  void show() {
    const radius = Radius.circular(24.0);
    final appState = Provider.of<AppStateModel>(context, listen: false);
    showModalBottomSheet(
      barrierColor: Theme.of(context).colorScheme.surfaceVariant,
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Provider<ChangeThemeBottomSheetWidgetModel>(
        create: (_) => ChangeThemeBottomSheetWidgetModel(state: appState)..init(),
        dispose: (_, wm) => wm.dispose(),
        child: Material(
          elevation: 20,
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(topLeft: radius, topRight: radius),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _BottomSheetAppBar(),
              _ThemesList(),
              _AcceptButton(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет заголовка модального окна
class _BottomSheetAppBar extends StatelessWidget {
  const _BottomSheetAppBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: 24,
              height: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  color: scheme.surfaceTint,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringsConstants.bottomSheetTitle,
                style: theme.textTheme.customTitle.copyWith(color: scheme.tertiary),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close_rounded, size: 24, color: scheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Виджет списка типов тем
class _ThemesList extends StatefulWidget {
  const _ThemesList();

  @override
  State<_ThemesList> createState() => _ThemesListState();
}

/// Состояние виджета списка типов тем
class _ThemesListState extends State<_ThemesList> {
  /// Логика модального окна
  late ChangeThemeBottomSheetWidgetModel bottomSheetWM;

  @override
  void initState() {
    super.initState();
    bottomSheetWM = Provider.of<ChangeThemeBottomSheetWidgetModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: bottomSheetWM.themeTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomRadioButton(
            isSelected: bottomSheetWM.themeTypes[index].isSelected,
            name: bottomSheetWM.themeTypes[index].name,
            schemas: bottomSheetWM.themeTypes[index].schemas,
            onThemeTypeTap: () => _onThemeTypeTap(index),
            onSchemeTap: _onSchemeTap,
          );
        },
      ),
    );
  }

  /// Обработчик нажатия на тему
  void _onThemeTypeTap(int index) {
    setState(() {
      bottomSheetWM.onThemeTypeTap(index);
    });
  }

  /// Обработчик нажатия на схему
  void _onSchemeTap(AppTheme scheme) {
    setState(() {
      bottomSheetWM.onSchemeTap(scheme);
    });
  }
}

/// Виджет кнопки сохранения темы
class _AcceptButton extends StatelessWidget {
  const _AcceptButton();

  @override
  Widget build(BuildContext context) {
    ChangeThemeBottomSheetWidgetModel bottomSheetWM =
        Provider.of<ChangeThemeBottomSheetWidgetModel>(context, listen: false);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.mainButton.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(colorScheme.primary),
                    side: MaterialStateProperty.all(BorderSide(width: 1, color: colorScheme.primary)),
                  ),
              onPressed: () {
                Navigator.of(context).pop();
                bottomSheetWM.saveTheme();
              },
              child: const Text(StringsConstants.acceptButtonName),
            ),
          ),
        ),
      ],
    );
  }
}
