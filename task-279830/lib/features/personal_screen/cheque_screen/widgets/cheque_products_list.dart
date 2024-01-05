import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_279830/core/domain/domain.dart';
import 'package:task_279830/core/domain/entities/products_group_entity.dart';
import 'package:task_279830/core/library/product_group_items_widget.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/cheque_bloc.dart';

/// Виджет списка покупок
class ChequeProductsList extends StatefulWidget {
  const ChequeProductsList({super.key});

  @override
  State<ChequeProductsList> createState() => _ChequeProductsListState();
}

/// Состояние виджета списка покупок
class _ChequeProductsListState extends State<ChequeProductsList> {
  /// Класс бизнес логики экран чека
  ChequeBloc get bloc => Provider.of<ChequeBloc>(context, listen: false);

  /// Контроллер для прокрутки списка
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    bloc.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<ProductEntity>?>.value(value: bloc.productsStream, initialData: null),
        StreamProvider<SortingTypesEnum?>.value(value: bloc.selectedSortingTypeStream, initialData: null),
      ],
      child: Consumer2<List<ProductEntity>?, SortingTypesEnum?>(builder: (context, products, type, _) {
        if (products == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (products.isEmpty) {
          return Center(
            child: Text('Здесь пока ничего нет', style: Theme.of(context).textTheme.customSubtitleDark),
          );
        } else {
          final data = bloc.groupingProduct(products).map((key, value) => MapEntry(key, bloc.sortBySortingType(value)));
          final List<ProductsGroupEntity> results =
              data.keys.map((category) => ProductsGroupEntity(category, data[category]!)).toList();

          return Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: results.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProductGroupItemsWidget(
                      group: results[index],
                      usingDivider: index < results.length - 1,
                    );
                  }),
            ),
          );
        }
      }),
    );
  }
}
