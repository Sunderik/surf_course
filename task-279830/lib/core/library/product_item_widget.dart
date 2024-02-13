import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/domain.dart';
import 'package:task_279830/core/library/unloaded_product_image.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

/// Базовый размер изображения товара
const double _imageSideSize = 68;

/// Виджет отображения карточки товара
class ProductItemWidget extends StatelessWidget {
  /// Модель отображаемого товара
  final ProductEntity productEntity;

  const ProductItemWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          _ProductItemImage(imageURL: productEntity.imageUrl),
          const SizedBox(width: 16),
          _ProductItemDescription(productEntity: productEntity),
        ],
      ),
    );
  }
}

/// Виджет изображения товара в карточке товара
class _ProductItemImage extends StatelessWidget {
  /// Адрес по которому находится изображение
  final String imageURL;

  const _ProductItemImage({required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: _imageSideSize,
        height: _imageSideSize,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageURL,
          imageBuilder: (context, imageProvider) => DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const UnloadedProductImage(),
        ),
      ),
    );
  }
}

/// Виджет описания товара в карточке товара
class _ProductItemDescription extends StatelessWidget {
  /// Модель для которой составляется описание товара
  final ProductEntity productEntity;

  const _ProductItemDescription({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final amount = productEntity.amount is Grams ? productEntity.amount.value * 0.001 : productEntity.amount.value;
    final unitsOfMeasurement = productEntity.amount is Grams ? 'кг' : 'шт';
    return Expanded(
      child: SizedBox(
        height: _imageSideSize,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    productEntity.title,
                    style: textTheme.customTextDark,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    '${amount.toString()} $unitsOfMeasurement',
                    style: textTheme.customTextDark,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: _ProductItemPrice(
                    price: productEntity.price,
                    sale: productEntity.sale,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// Виджет скидки и цены товара в описании товара
class _ProductItemPrice extends StatelessWidget {
  /// Цена товара
  final int price;

  /// Скидка на товар
  final double sale;

  const _ProductItemPrice({required this.price, required this.sale});

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[];
    final textTheme = Theme.of(context).textTheme;
    if (sale > 0) {
      // Цена товара с учетом скидки
      final priceWithSale = price * (0.01 * sale);
      content.addAll([
        Expanded(
          flex: 3,
          child: Text(
            '${price.toString()} руб',
            style: textTheme.customCrossedText,
            maxLines: 1,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            priceWithSale.toStringAsFixed(0),
            style: textTheme.customTextBoldRed,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]);
    } else {
      content.add(
        Flexible(
          child: Text(
            price.toString(),
            style: textTheme.customTextBoldDark,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    return Row(children: content);
  }
}
