import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_279830/core/domain/entities/product_entity.dart';
import 'package:task_279830/core/theme/color_constants.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/cheque_bloc.dart';

/// Заголовок нижней части чека
const String _title = 'В вашей покупке';

/// Виджет нижней части чека
class ChequeProductsListFooter extends StatefulWidget {
  const ChequeProductsListFooter({super.key});

  @override
  State<ChequeProductsListFooter> createState() => _ChequeProductsListFooterState();
}

/// Состояние виджета нижней части чека
class _ChequeProductsListFooterState extends State<ChequeProductsListFooter> {
  /// Класс бизнес логики экран чека
  ChequeBloc get bloc => Provider.of<ChequeBloc>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder<List<ProductEntity>>(
        stream: bloc.productsStream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const SizedBox();
          } else {
            return Column(
              children: [
                const Divider(
                  thickness: 1,
                  color: customGrey,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      _title,
                      style: theme.textTheme.customTitleBoldDark,
                    )
                  ],
                ),
                _CalculatedSumsSection(products: data),
              ],
            );
          }
        });
  }
}

/// Виджет с суммами и скидками для чека на основе массива товаров из [products]
class _CalculatedSumsSection extends StatelessWidget {
  /// Массив товаров на основе которого рассчитываются скидки итоговые суммы.
  final List<ProductEntity> products;

  const _CalculatedSumsSection({required this.products});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    /// Итоговая сумма без скидок
    final totalSumWithoutSale = products.map((e) => e.price).reduce((a, b) => a + b);

    /// Итоговая сумма со скидками
    final totalSumWithSale =
        products.map((e) => e.sale > 0 ? e.price * (e.sale * 0.01) : e.price).reduce((a, b) => a + b);

    /// Величина скидки в деньгах
    final removedSum = totalSumWithoutSale - totalSumWithSale;

    /// Величина скидки в процентах
    final totalSale = removedSum / (totalSumWithoutSale * 0.01);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${products.length} товаров',
                style: theme.textTheme.customTextDark,
              ),
              Text(
                '$totalSumWithoutSale руб',
                style: theme.textTheme.customSubtitleBoldDark,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Скидка ${totalSale.toStringAsFixed(2)}%',
                style: theme.textTheme.customTextDark,
              ),
              Text(
                '-$removedSum руб',
                style: theme.textTheme.customSubtitleBoldDark,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Итого',
                style: theme.textTheme.customSubtitleBoldDark,
              ),
              Text(
                '$totalSumWithSale руб',
                style: theme.textTheme.customSubtitleBoldDark,
              )
            ],
          ),
        ),
      ],
    );
  }
}
