import 'package:collection/collection.dart';

/// Объект изделия
class Article {
  /// Идентификатор
  final int id;

  /// Категория
  final String category;

  /// Наименование
  final String name;

  /// Цена
  final int price;

  /// Количество
  final int count;

  Article({required this.id, required this.category, required this.name, required this.price, required this.count});

  /// Получение объекта изделия из ее описательной строки, либо null, если допущены ошибки в строке.
  static Article? fromString(String rawArticle) {
    // Проверка строки на наличие данных
    if (rawArticle.isEmpty) {
      return null;
    }

    /// Набор параметров изделия в виде строк, найденных в исходной строке
    final articleProperties = rawArticle.split(',');

    // Проверка количества параметров
    if (articleProperties.length != 5) {
      return null;
    }

    /// Шаблон корректной последовательности типов параметров
    final List<Type> typesTemplate = [int, String, String, int, int];

    /// Набор параметров в нужном типе
    final List factValues = [];

    // Заполнение набора параметров в корректном типе
    for (var i = 0; i < articleProperties.length; i++) {
      factValues.add(int.tryParse(articleProperties[i]) ?? articleProperties[i]);
    }

    // Набор фактических типов параметров
    final List<Type> factTypes = factValues.map((e) => e.runtimeType).toList();

    //  Сравнения факта и шаблона
    if (IterableEquality().equals(factTypes, typesTemplate)) {
      return Article(
          id: factValues[0], category: factValues[1], name: factValues[2], price: factValues[3], count: factValues[4]);
    } else {
      return null;
    }
  }

  /// Печать описание изделия в консоль согласно шаблону из задания
  void toPrint() {
    print('$id $category $name $price рублей $count шт');
  }
}
