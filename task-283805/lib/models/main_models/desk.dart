import 'package:task_283805/models/models.dart';

/// Объект обычного стола
class Desk extends Table {
  Desk(
    super.name,
    super.description,
    super.size, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
    required super.boxCount,
  });

  /// Конструктор создания базового стола, который был на каждой кухне
  Desk.simpleDesk()
      : this(
          'Простой стол',
          'Описание очень простого стола',
          Size(height: 750, width: 1800, depth: 800),
          guid: 'simpleDesk_1',
          boxCount: 0,
          legsCount: 4,
          weight: 10,
          features: [],
          materials: [
            Material('ЛДСП', 'Самый распространенный материал для мебели', 8000,
                guid: 'material_1',
                manufacturer: Company(
                    'ООО "Рога и копыта"', 'Настолько простая фирма, что даже подозрительно', 'Платформа 9 и 3/4',
                    guid: 'company_1', registrationCountry: 'Великобритания'))
          ],
        );
}
