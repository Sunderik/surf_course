import 'package:task_283810/bloc.dart';
import 'package:task_283810/datas/raw_data.dart';
import 'package:task_283810/models/filter.dart';

void main(List<String> arguments) {
  // Присваиваем дату для которые проверяем просрочку товаров.
  final DateTime comparedDate = DateTime(2022, 12, 21);

  // Формируем объект бизнес-логики задания и вызываем на него метод группировки и фильтрации.
  final result = BusinessLogic(
          rawData: rawData, usingFilters: [FilterByRemainder(), FilterByExpirationDate(comparedDate: comparedDate)])
      .getStructuredAndFilteredData();

  // Аккуратно выводим результат в консоль.
  BusinessLogic.printStructuredData(result);
}
