
import 'package:task_283809/article.dart';
import 'package:task_283809/data.dart';
import 'package:task_283809/filter.dart';

void main(List<String> arguments) {
  final articles =
      data.split("\n").map((e) => Article.fromString(e)).where((article) => article != null).cast<Article>().toList();

  print('Исходные данные:');
  articles.forEach((e) => e.toPrint());
  print('-------------------------------------');

  print('');
  print('Фильтрация по категории [хлеб] через класс:');
  applyFilter(articles, FilterByCategory(category: 'хлеб'));
  print('Фильтрация по категории [хлеб] через дженерик:');
  applyFilterOnGenerics<FilterByCategory>(articles, FilterByCategory(category: 'хлеб'));
  print('-------------------------------------');

  print('');
  print('Фильтрация по оставшемуся количеству не больше 50 шт:');
  applyFilter(articles, FilterByCount(maxCount: 50));
  print('Фильтрация по оставшемуся количеству не больше 50 шт через дженерик:');
  applyFilterOnGenerics<FilterByCount>(articles, FilterByCount(maxCount: 50));
  print('-------------------------------------');

  print('');
  print('Фильтрация по максимальной цене в 50 рублей:');
  applyFilter(articles, FilterByPrice(maxPrice: 50));
  print('Фильтрация по максимальной цене в 50 рублей через дженерик:');
  applyFilterOnGenerics<FilterByPrice>(articles, FilterByPrice(maxPrice: 50));
}

/// Метод фильтрации изделий через sealed класс
void applyFilter(List<Article> articles, Filter filter) {
  articles.where((e) => filter.apply(e)).forEach((e) => e.toPrint());
}

/// Метод фильтрации изделий через дженерик
void applyFilterOnGenerics<T extends Filter>(List<Article> articles, T filter) {
  articles.where((e) => filter.apply(e)).forEach((e) => e.toPrint());
}
