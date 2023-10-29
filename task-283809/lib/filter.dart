import 'package:task_283809/article.dart';

/// Базовый клас фильтра
sealed class Filter {
  /// Метод определения удовлетворения изделием [article] условию фильтра
  bool apply(Article article);
}

/// Фильтр изделий по категории [category]
class FilterByCategory extends Filter {
  /// Категория для фильтрации
  final String category;

  FilterByCategory({required this.category});

  /// Фильтрацию по совпадению категории фильтра и категории изделия
  @override
  bool apply(Article article) {
    return article.category == category;
  }
}

/// Фильтр изделий по цене [maxPrice]
class FilterByPrice extends Filter {
  /// Максимальная цена за изделие
  final int maxPrice;

  FilterByPrice({required this.maxPrice});

  /// Фильтрацию по не преувеличению цены изделия  [article] максимальной [maxPrice]
  @override
  bool apply(Article article) {
    return article.price <= maxPrice;
  }
}

/// Фильтр изделий по остаткам [maxCount]
class FilterByCount extends Filter {
  /// Максимальное количеств оставшихся изделий
  final int maxCount;

  FilterByCount({required this.maxCount});

  /// Фильтрацию по количеству остатков изделия  [article], которых меньше чем [maxCount]
  @override
  bool apply(Article article) {
    return article.count < maxCount;
  }
}
