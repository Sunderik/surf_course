import 'package:collection/collection.dart' show groupBy;
import 'package:task_283810/models/filter.dart';
import 'package:task_283810/models/raw_product_item.dart';

/// Тип сгруппированного и отфильтрованного списка.
typedef StructuredData = Map<String, Map<String, List<String>>>;

/// Класс бизнес логики приложения
class BusinessLogic {
  /// Простой список продуктов
  final List<RawProductItem> rawData;

  /// Список фильтров которые нужно применить к с писку продуктов [rawData]
  final List<Filter> usingFilters;

  BusinessLogic({required this.rawData, this.usingFilters = const <Filter>[]}) : assert(rawData.isNotEmpty);

  /// Возвращает структурированный и отфильтрованный по фильтрам [usingFilters] список продуктов из [rawData].
  StructuredData getStructuredAndFilteredData() {
    // Сначала присваиваем переменной сырой список продуктов
    var data = rawData;

    // Если есть фильтры то применяем их к списку
    if (usingFilters.isNotEmpty) {
      data = _applyingFilters();
    }

    // Отсортированный список пропускаем через две группировки, и отсев дубликатов через набор.
    return groupBy(data, (obj1) => obj1.categoryName).map((key1, value) => MapEntry(
        key1,
        groupBy(value, (obj2) => obj2.subcategoryName)
            // Используем превращение в набор и обратно в список чтобы соблюсти условия задачи и исключить возможность дубликатов.
            .map((key2, value) => MapEntry(key2, value.map((e) => e.name).toSet().toList()))));
  }

  /// Выводи в консоль в табулированном виде данные структурированной и сгруппированного списка продуктов
  static void printStructuredData(StructuredData data) {
    print("{");
    data.forEach((key, value) {
      print("\t'$key':");
      value.forEach((key, value) {
        print("\t\t'$key': ${value.toList()},");
      });
    });
    print("}");
  }

  /// Применяем фильтры к текущему набору сырых данных
  List<RawProductItem> _applyingFilters() {
    List<RawProductItem> filteredData = rawData;
    for (var filter in usingFilters) {
      filteredData = filteredData.where((product) => filter.apply(product)).toList();
    }
    return filteredData;
  }
}
