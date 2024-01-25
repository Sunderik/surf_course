import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/objects/sorting_type.dart';
import 'package:task_279830/core/theme/color_constants.dart';
import 'package:task_279830/core/theme/extensions/elevated_button_extension.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

/// Заголовок модального окна
const String _title = 'Сортировка';

/// Функция используемая вне модального окна при смене типа сортировки
typedef CustomSortingTypeAction = void Function(SortingType type);

/// Функция смены типа сортировки для локального использования в рамках модельного окна
typedef _SetSortingTypeAction = void Function(SortingType? type);

/// Модельное окно выбора типа сортировки
class SortingBottomSheet {
  /// Текущий контекст дерева виджитов
  final BuildContext context;

  /// Тип сортировки который выбран при открытии модального окна
  final SortingType initSortingType;

  /// Функция выполняемая при смене типа сортировки
  final CustomSortingTypeAction changeSortingTypeAction;

  SortingBottomSheet({required this.context, required this.changeSortingTypeAction, required this.initSortingType});

  /// Отобразить модельное окно
  void show() {
    const radius = Radius.circular(24.0);
    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Material(
        elevation: 20,
        color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: radius, topRight: radius),
        child: _BottomSheetContent(
          changeSortingTypeAction: changeSortingTypeAction,
          initSortingType: initSortingType,
        ),
      ),
    );
  }
}

/// Виджет содержимого модального окна
class _BottomSheetContent extends StatefulWidget {
  /// Функция выполняемая при смене типа сортировки
  final CustomSortingTypeAction changeSortingTypeAction;
  final SortingType initSortingType;

  const _BottomSheetContent({required this.changeSortingTypeAction, required this.initSortingType});

  @override
  State<_BottomSheetContent> createState() => _BottomSheetContentState();
}

/// Состояния виджета содержимого модального окна
class _BottomSheetContentState extends State<_BottomSheetContent> {
  /// Локально выбранный тип сортировки, до его сохранения
  late SortingType _localSelectedType;

  @override
  void initState() {
    super.initState();
    _localSelectedType = widget.initSortingType;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _title,
                style: theme.textTheme.customTitleBold,
              ),
              IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.close,
                  color: customVioletDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _BottomSheetRadioButton(
            sortingType: WithoutSorting(),
            groupValue: _localSelectedType,
            setValueAction: _setTypeValue,
          ),
          const Divider(
            thickness: 1,
            color: customGrey,
          ),
          _BottomSheetGroupRadioButtons(
            groupName: 'По имени',
            sortingTypes: const [SortingByName(), SortingByName(isReversed: true)],
            groupValue: _localSelectedType,
            setValueAction: _setTypeValue,
          ),
          const Divider(
            thickness: 1,
            color: customGrey,
          ),
          _BottomSheetGroupRadioButtons(
            groupName: 'По цене',
            sortingTypes: const [SortingByCost(), SortingByCost(isReversed: true)],
            groupValue: _localSelectedType,
            setValueAction: _setTypeValue,
          ),
          const Divider(
            thickness: 1,
            color: customGrey,
          ),
          _BottomSheetGroupRadioButtons(
            groupName: 'По типу',
            sortingTypes: const [SortingByType(), SortingByType(isReversed: true)],
            groupValue: _localSelectedType,
            setValueAction: _setTypeValue,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            width: double.maxFinite,
            child: ElevatedButton(
                style: theme.elevatedButtonTheme.sortingElevatedButton,
                onPressed: () {
                  widget.changeSortingTypeAction(_localSelectedType);
                  Navigator.of(context).pop();
                },
                child: Text('Готово', style: theme.textTheme.customSubtitleBold.copyWith(color: Colors.white))),
          ),
        ],
      ),
    );
  }

  /// Функция изменения состояния модельного окна  при локальном изменении типа сортировки
  void _setTypeValue(SortingType? type) {
    if (type != null) {
      setState(() {
        _localSelectedType = type;
      });
    }
  }
}

/// Виджет группы радио-кнопок с типами сортировки
class _BottomSheetGroupRadioButtons extends StatelessWidget {
  /// Наименование группы радио-кнопок
  final String groupName;

  /// Типы сортировок входящих в группу
  final List<SortingType> sortingTypes;

  /// Групповое значение объединяющее все радиокнопки в модальном окне
  final SortingType groupValue;

  /// Функция смены типа сортировки при нажатии на радиокнопку
  final _SetSortingTypeAction setValueAction;

  const _BottomSheetGroupRadioButtons({
    required this.groupName,
    required this.sortingTypes,
    required this.groupValue,
    required this.setValueAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              groupName,
              style: theme.textTheme.customText,
            ),
          ],
        ),
        ...sortingTypes.map(
          (type) => _BottomSheetRadioButton(
            sortingType: type,
            groupValue: groupValue,
            setValueAction: setValueAction,
          ),
        ),
      ],
    );
  }
}

/// Виджет радио-кнопки для типа сортировки
class _BottomSheetRadioButton extends StatelessWidget {
  /// Тип сортировки для которого создается кнопка
  final SortingType sortingType;

  /// Групповое значение объединяющее все радиокнопки в модальном окне
  final SortingType groupValue;

  /// Функция смены типа сортировки при нажатии на радиокнопку
  final _SetSortingTypeAction? setValueAction;

  const _BottomSheetRadioButton({required this.sortingType, required this.groupValue, this.setValueAction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      type: MaterialType.transparency,
      child: RadioListTile<SortingType>(
        activeColor: customGreen,
        hoverColor: Colors.transparent,
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.transparent),
        title: Text(
          sortingType.name,
          style: theme.textTheme.customSubtitleDark,
        ),
        value: sortingType,
        groupValue: groupValue,
        onChanged: setValueAction,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
