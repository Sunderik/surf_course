import 'package:task_279830/core/domain/domain.dart';

/// Модель группы продуктов.
///
/// Содержит в себе категорию и список продуктов ей принадлежащий.
class ProductsGroupEntity {
  /// Категория группы  товаров.
  final Category category;

  /// Категория группы  товаров.
  final List<ProductEntity> products;

  ProductsGroupEntity(this.category, this.products);
}
