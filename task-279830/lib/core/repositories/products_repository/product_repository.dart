import 'package:task_279830/core/domain/domain.dart';
import 'package:task_279830/core/repositories/products_repository/data.dart';

/// Интерфейс репозитория продуктов
mixin IProductRepository {
  /// Метод получения потока со списком продуктов
  Future<List<ProductEntity>> fetchProducts();
}

/// Реализация интерфейса репозитория продуктов на основе получения данных из заранее внесенных данных
class ProductRepositoryFromData implements IProductRepository {
  ProductRepositoryFromData();

  @override
  Future<List<ProductEntity>> fetchProducts() {
    return Future.value(Data.dataForStudents).then((list) => list.map((dto) => dto.toEntity()).toList());
  }
}
