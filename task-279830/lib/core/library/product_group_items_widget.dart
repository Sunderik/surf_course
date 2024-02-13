import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/entities/products_group_entity.dart';
import 'package:task_279830/core/library/product_item_widget.dart';
import 'package:task_279830/core/theme/color_constants.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

/// Виджет для отображения группы товаров в списке в рамках одной категории
class ProductGroupItemsWidget extends StatelessWidget {
  /// Признак того, что в конце группы нужно отобразить разделитель
  ///
  /// (Если это последняя группа, то указывать false)
  final bool usingDivider;

  /// Группа товаров которая будет отображена
  final ProductsGroupEntity group;

  const ProductGroupItemsWidget({required this.group, super.key, this.usingDivider = true});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Text(
                  group.category.name,
                  style: Theme.of(context).textTheme.customSubtitleBoldDark,
                )
              ],
            ),
          ),
          ListView.builder(
              controller: scrollController,
              itemCount: group.products.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductItemWidget(productEntity: group.products[index]);
              }),
          if (usingDivider)
            const Divider(
              thickness: 1,
              color: customGrey,
            ),
        ],
      ),
    );
  }
}
