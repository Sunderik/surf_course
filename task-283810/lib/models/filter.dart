import 'package:task_283810/models/raw_product_item.dart';

/// Базовый клас фильтра
sealed class Filter {
  /// Метод определения удовлетворения изделием [product] условию фильтра
  bool apply(RawProductItem product);
}

/// Фильтр изделий по сроку годности [comparedDate]
class FilterByExpirationDate extends Filter {
  /// Дата для которой проверяется срок годности
  final DateTime comparedDate;

  FilterByExpirationDate({required this.comparedDate});

  /// Фильтрацию по сроку годности, true если он до указанной [comparedDate] даты.
  @override
  bool apply(RawProductItem product) {
    // Переводим время в формат по гринвичу для избегания ошибок часовых поясов.
    return product.expirationDate.toUtc().isAfter(comparedDate.toUtc());
  }
}

/// Фильтр изделий по остаткам
class FilterByRemainder extends Filter {
  FilterByRemainder();

  /// Фильтрацию по количеству остатков продуктов  [product], которые должны быть больше чем 0
  @override
  bool apply(RawProductItem product) {
    return product.qty > 0;
  }
}
