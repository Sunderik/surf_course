/// Перечисление стран
enum Countries { brazil, russia, turkish, spain, japan }

/// Объект территории
class Territory {
  /// Площадь в гектарах
  int areaInHectare;

  /// Названия выращиваемых культур
  List<String> crops;

  /// Сельхоз. оборудование
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

/// Объект сельхоз. оборудование
class AgriculturalMachinery {
  /// Идентификатор
  final String id;

  /// Дата изготовления
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}
