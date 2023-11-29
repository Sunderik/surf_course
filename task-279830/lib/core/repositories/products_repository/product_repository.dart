import 'package:task_279830/core/domain/domain.dart';
import 'package:task_279830/core/repositories/products_repository/data.dart';

/// Интерфейс репозитория продуктов
mixin IProductRepository {
  /// Метод получения потока со списком продуктов
  Stream<List<ProductEntity>> fetchProducts();
}

/// Реализация интерфейса репозитория продуктов на основе получения данных из заранее внесенных данных
class ProductRepositoryFromData implements IProductRepository {
  ProductRepositoryFromData();

  @override
  Stream<List<ProductEntity>> fetchProducts() {
    return Stream.value(Data.dataForStudents).map((list) => list.map((dto) => dto.toEntity()).toList());
  }
}
