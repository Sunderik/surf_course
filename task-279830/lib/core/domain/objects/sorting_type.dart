import 'package:equatable/equatable.dart';
import 'package:task_279830/core/domain/domain.dart';

/// Список покупок
typedef ProductsList = List<ProductEntity>;

/// Перечисление доступных видов сортировки товара.
enum _SortingTypesEnum {
  /// Отсутствует
  none('Без сортировки'),

  /// По имени
  byName('По имени от А до Я'),

  /// По имени (обратная)
  byNameRevers('По имени от Я до А'),

  /// По цене
  byCost('По возрастанию'),

  /// По цене (обратная)
  byCostRevers('По убыванию'),

  /// По типу
  byType('По типу от А до Я'),

  ///  По типу (обратная)
  byTypeRevers('По типу от Я до А');

  /// Наименование типа сортировки
  final String name;

  const _SortingTypesEnum(this.name);
}

/// Базовый клас типа сортировки товара
sealed class SortingType extends Equatable {
  /// Признак того что результат нужно отобразить в обратном порядке, по умолчанию ***false***
  final bool isReversed;

  /// Базовый клас типа сортировки товара
  const SortingType({this.isReversed = false});

  /// Наименование сортировки
  String get name;

  /// Метод сортировки списка товаров из внутреннего свойства [_products]
  ProductsList sort(ProductsList products);

  ///  Внутренний метод класса меняющий порядок элементов списки [products], на основании признака [isReversed]
  ProductsList _checkOnRevers(ProductsList products) {
    return isReversed ? products.reversed.toList() : products;
  }

  @override
  List<Object> get props => [name, isReversed];
}

/// Без сортировки товаров
class WithoutSorting extends SortingType {
  WithoutSorting();

  @override
  String get name => _SortingTypesEnum.none.name;

  /// Сортировка товара отсутствует
  @override
  ProductsList sort(ProductsList products) {
    return List.from(products);
  }
}

/// Сортировка товара по имени
class SortingByName extends SortingType {
  const SortingByName({super.isReversed});

  @override
  String get name => isReversed ? _SortingTypesEnum.byNameRevers.name : _SortingTypesEnum.byName.name;

  /// Сортирует товар по его имени [ProductEntity.title], и если [isReversed] равен true ,то меняет порядок
  /// элементов результата сортировки на обратный
  @override
  ProductsList sort(ProductsList products) {
    final localProducts = ProductsList.from(products);
    localProducts.sort((a, b) => a.title.compareTo(b.title));
    return _checkOnRevers(localProducts);
  }
}

/// Сортировка товара по стоимости
class SortingByCost extends SortingType {
  const SortingByCost({super.isReversed});

  @override
  String get name => isReversed ? _SortingTypesEnum.byCostRevers.name : _SortingTypesEnum.byCost.name;

  /// Сортирует товар по его стоимости [ProductEntity.price], и если [isReversed] равен true ,то меняет порядок
  /// элементов результата сортировки на обратный
  @override
  ProductsList sort(ProductsList products) {
    final localProducts = ProductsList.from(products);
    localProducts.sort((a, b) => a.price.compareTo(b.price));
    return _checkOnRevers(localProducts);
  }
}

/// Сортировка товара по типу
class SortingByType extends SortingType {
  const SortingByType({super.isReversed});

  @override
  String get name => isReversed ? _SortingTypesEnum.byTypeRevers.name : _SortingTypesEnum.byType.name;

  /// Сортирует товар по его типу [ProductEntity.category], и если [isReversed] равен true ,то меняет порядок
  /// элементов результата сортировки на обратный
  @override
  ProductsList sort(ProductsList products) {
    final localProducts = ProductsList.from(products);
    localProducts.sort((a, b) => a.category.name.compareTo(b.category.name));
    return _checkOnRevers(localProducts);
  }
}
