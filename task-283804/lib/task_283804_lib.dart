import '../models.dart';

/// Возвращает объединенный словарь территорий передуваемых в [maps]
Map<Countries, List<Territory>> mergeTerritoriesMaps(List<Map<Countries, List<Territory>>> maps) {
  if (maps.isEmpty) {
    return {};
  }

  final result = <Countries, List<Territory>>{};

  for (final map in maps) {
    for (final entry in map.entries) {
      if (result.containsKey(entry.key)) {
        result[entry.key]?.addAll(entry.value);
      } else {
        result[entry.key] = entry.value;
      }
    }
  }

  return result;
}

/// Возвращает единый список территорий [Territory]
List<Territory> getTerritoriesListFromMap(Map<Countries, List<Territory>> map) {
  if (map.isEmpty) {
    return [];
  }

  final result = <Territory>[];

  for (final territories in map.values) {
    result.addAll(territories);
  }

  return result;
}

/// Возвращает отсортированный по увеличению возраста список сельхоз техники, находящейся на территориях передаваемых в
/// [territories]
Set<AgriculturalMachinery> getSortingAllAgriculturalMachinery(List<Territory> territories) {
  if (territories.isEmpty) {
    return {};
  }
  // Собирает список всей техники с территорий
  final allMachineries = [for (var t in territories) ...t.machineries];

  final sortedList = allMachineries;
  sortedList.sort((a, b) => calculateAge(b.releaseDate).compareTo(calculateAge(a.releaseDate)));
  // Удаляет все дубликаты перед возвратом ответа
  return sortedList.toSet();
}

/// Возвращает половину с самой старой техникой из писка [machineries]
Set<AgriculturalMachinery> searchOlderHalf(Set<AgriculturalMachinery> machineries) {
  if (machineries.isEmpty) {
    return {};
  }

  return machineries.toList().sublist(0, (machineries.length / 2).round()).toSet();
}

/// Возвращает средний возраст сельхоз техники передаваемой в [machineries]
double calculateAverageAgeAmongAll(Set<AgriculturalMachinery> machineries) {
  if (machineries.isEmpty) {
    return 0;
  }

  final result = machineries.map((m) => calculateAge(m.releaseDate)).reduce((a, b) => a + b) / machineries.length;

  return double.parse(result.toStringAsFixed(1));
}

/// Вычисляет возраст техники относительно текущего года
int calculateAge(DateTime releaseDate) {
  final age = DateTime.now().year - releaseDate.year;
  return age < 0 ? 0 : age;
}
