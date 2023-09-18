import 'package:task_283804/task_283804_data.dart';
import 'package:task_283804/task_283804_lib.dart';

/// Точка входа в программу.
///
/// [arguments] - список аргументов принимаемых программой.
void main(List<String> arguments) {
  // Получаем объединенный список территорий
  final territories = mergeTerritoriesMaps([mapBefore2010, mapAfter2010]);

  // Получаем отсортированный набор уникальных механизмов
  final machineries = getSortingAllAgriculturalMachinery(getTerritoriesListFromMap(territories));

  // Получаем старшую половину техники
  final olderHalfMachineries = searchOlderHalf(machineries);

  print('Средний возраст техники в годах: ${calculateAverageAgeAmongAll(machineries)};');

  print('Средний возраст 50% самой старой техники в годах: ${calculateAverageAgeAmongAll(olderHalfMachineries)};');
}
