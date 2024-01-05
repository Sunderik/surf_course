import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_279830/core/domain/enums/sorting_types_enum.dart';
import 'package:task_279830/core/library/sorting_bottom_sheet.dart';
import 'package:task_279830/core/theme/color_constants.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/cheque_bloc.dart';

/// Заголовок верхней части чека
const _title = 'Список покупок';

/// Виджет верхней части чека
class ChequeProductsListHeader extends StatefulWidget {
  const ChequeProductsListHeader({super.key});

  @override
  State<ChequeProductsListHeader> createState() => _ChequeProductsListHeaderState();
}

/// Состояние виджета верхней части чека
class _ChequeProductsListHeaderState extends State<ChequeProductsListHeader> {
  /// Класс бизнес логики экран чека
  ChequeBloc get bloc => Provider.of<ChequeBloc>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_title, style: Theme.of(context).textTheme.customTitleBoldDark),
        StreamBuilder<SortingTypesEnum>(
            stream: bloc.selectedSortingTypeStream,
            builder: (context, snapshot) {
              return _FilterButton(sortingIsUsed: bloc.sortingIsUsed);
            }),
      ],
    );
  }
}

/// Виджет отображения кнопки выбора сортировки
///
/// Вызывает модальное окно с выбором типа сортировки
class _FilterButton extends StatelessWidget {
  /// Признак использования какой-либо сортировки.
  final bool sortingIsUsed;

  const _FilterButton({this.sortingIsUsed = false});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ChequeBloc>(context, listen: false);
    return Material(
      color: customGrey,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () => SortingBottomSheet(
                context: context,
                changeSortingTypeAction: bloc.changeSelectedSortingType,
                initSortingType: bloc.selectedSortingType)
            .show(),
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          width: 32,
          height: 32,
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.sort,
                  color: customVioletLight,
                ),
              ),
              if (sortingIsUsed)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                    child: SizedBox(
                      width: 8,
                      height: 8,
                      child: CustomPaint(
                        painter: OpenPainter(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет отрисовки индикатора использования  какой-либо сортировки
class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = customGreen
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
