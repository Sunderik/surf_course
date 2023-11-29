import 'package:task_279830/core/domain/domain.dart';

/// Модель продукта.
///
/// Содержит в себе название, цену, категорию и ссылку на изображение.
class ProductDTO {
  final String title;

  /// Цена товара в копейках. Без скидки.
  final int price;

  /// Категория товара.
  final Category category;

  /// Ссылка на изображение товара.
  final String imageUrl;

  /// Количество товара.
  ///
  /// Может быть описано в граммах [Grams] или в штуках [Quantity].
  final Amount amount;

  /// Скидка на товар.
  ///
  /// Требуется высчитать самостоятельно итоговую цену товара.
  final double sale;

  ProductDTO({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });

  ProductEntity toEntity() {
    return ProductEntity(
        title: title, price: price, category: category, imageUrl: imageUrl, amount: amount, sale: sale);
  }
}
