import 'dart:async';
import 'dart:core';

import 'package:collection/collection.dart';
import 'package:task_279830/core/domain/domain.dart';
import 'package:task_279830/core/domain/logic/prodicts_list_sorting_mixin.dart';
import 'package:task_279830/core/repositories/products_repository/product_repository.dart';

/// Объект бизнес логики экрана для чека с покупками.
class ChequeBloc extends BaseBloc with ProductsListSortingMixin {
  /// Репозиторий источника данных
  late IProductRepository _repository;

  /// Контроллер списка продуктов.
  StreamController<List<ProductEntity>>? _productsController;

  /// Поток контроллера списка продуктов.
  Stream<List<ProductEntity>>? get productsStream => _productsController?.stream;

  @override
  void init() {
    super.init();
    sortingMixinInit();
    _repository = ProductRepositoryFromData();
    _productsController = StreamController<List<ProductEntity>>.broadcast();
  }

  @override
  void dispose() {
    super.dispose();
    sortingMixinDispose();
    _productsController?.close();
  }

  /// Получить список продуктов
  Future<void> fetchProducts() async {
    _sinkProducts(await _repository.fetchProducts());
  }

  /// Обновить список продуктов
  Future<void> refreshProducts() async {
    _clearProducts();
    fetchProducts();
  }

  /// Группирует входной массив продуктов по их категориям
  Map<Category, List<ProductEntity>> groupingProduct(List<ProductEntity> products) {
    return groupBy(products, (product) => product.category);
  }

  /// Очистить список продуктов
  Future<void> _clearProducts() async {
    _sinkProducts([]);
  }

  /// Отправить сигнал контроллеру списка продуктов.
  void _sinkProducts(List<ProductEntity> products) {
    _productsController?.sink.add(products);
  }
}
