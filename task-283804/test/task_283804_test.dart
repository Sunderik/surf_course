import 'package:task_283804/task_283804_lib.dart';
import 'package:test/test.dart';

import 'task_283804_tests_data.dart';

void main() {
  group('Группа тестов метода \'mergeTerritoriesMaps\'', () {
    test('Объединение пустого списка карт', () {
      final result = mergeTerritoriesMaps([]);
      expect(result, {});
    });
    test('Объединение территорий списка дух карт с уникальными странами', () {
      final result = mergeTerritoriesMaps([mapWithSingleCountry1, mapWithSingleCountry3]);
      int territoryCount = 0;
      for (var list in result.values) {
        territoryCount += list.length;
      }
      expect(territoryCount, 4);
    });
    test('Объединение территорий списка дух карт с одинаковыми странами', () {
      final result = mergeTerritoriesMaps([mapWithSingleCountry1, mapWithSingleCountry2]);
      int territoryCount = 0;
      for (var list in result.values) {
        territoryCount += list.length;
      }
      expect(territoryCount, 4);
    });
  });
  group('Группа тестов метода \'getTerritoriesListFromMap\'', () {
    test('Пустой список на основе пустой карты', () {
      final result = getTerritoriesListFromMap(emptyMap);
      expect(result, []);
    });
    test('Список территорий из карты стран без дубликатов территорий', () {
      final result = getTerritoriesListFromMap(mapCountriesWithoutTerritoryDuplicates);
      expect(result.length, 4);
    });
    test('Список территорий из карты стран без дубликатов территорий', () {
      final result = getTerritoriesListFromMap(mapCountriesWithTerritoryDuplicates);
      expect(result.length, 7);
    });
  });
  group('Группа тестов метода \'getSortingAllAgriculturalMachinery\'', () {
    test('Пустой список механизмов на основе пустого списка территорий', () {
      final result = getSortingAllAgriculturalMachinery([]);
      expect(result, []);
    });
    test('Список механизмов отсортирован по увеличению возраста', () {
      final result = getSortingAllAgriculturalMachinery(territoryList).toList();
      bool sortingIsObserved = true;
      for (var i = 0; i < result.length - 2; i++) {
        if (calculateAge(result[i].releaseDate) < calculateAge(result[i + 1].releaseDate)) {
          sortingIsObserved = false;
        }
      }
      expect(sortingIsObserved, true);
    });
    test('Список территорий из карты стран без дубликатов территорий', () {
      final result = getSortingAllAgriculturalMachinery(territoryList);
      final resultSet = result.toSet(); // Убирает дубликаты из списка при приведении к набору.

      expect(result.length, resultSet.length);
    });
  });
  group('Группа тестов метода \'searchOlderHalf\'', () {
    test('Старшая половина для пустого списка тоже пуста', () {
      final result = searchOlderHalf({});
      expect(result, []);
    });
    test('Старшая половина для нечётного списка', () {
      final result = searchOlderHalf(machineriesNonEvenList);
      expect(result.length, 2.0);
    });
    test('Старшая половина для чётного списка', () {
      final result = searchOlderHalf(machineriesEvenList);
      expect(result.length, 2.0);
    });
  });
  group('Группа тестов метода \'calculateAverageAgeAmongAll\'', () {
    test('Средний возраст пустого спина равен 0', () {
      final result = calculateAverageAgeAmongAll({});
      expect(result, 0.0);
    });
    test('Расчет среднего возраста техники корректен для нечетного списка', () {
      final result = calculateAverageAgeAmongAll(machineriesNonEvenList);
      expect(result, 4.0);
    });
    test('Расчет среднего возраста техники корректен для четного списка', () {
      final result = calculateAverageAgeAmongAll(machineriesEvenList);
      expect(result, 3.0);
    });
  });
  group('Группа тестов метода \'calculateAge\'', () {
    test('Возраст техники текущего года выпуска равен 0', () {
      final result = calculateAge(DateTime.now());
      expect(result, 0.0);
    });
    test('Возраст техники предыдущего года выпуска равен 1', () {
      final now = DateTime.now();
      final result = calculateAge(DateTime(now.year - 1));
      expect(result, 1.0);
    });
    test('Возраст техники следующего года выпуска равен 0', () {
      final now = DateTime.now();
      final result = calculateAge(DateTime(now.year + 1));
      expect(result, 0.0);
    });
  });
}
