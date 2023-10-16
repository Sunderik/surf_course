import 'package:task_283805/models/models.dart';

/// Объект табуретки
///
/// У данной модели отсутствует спинка и  [backrestTilt] равен [Null]
class Stool extends Chair {
  Stool(
    super.name,
    super.description,
    super.size,
    super.backrestTilt, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
  }) {
    backrestTilt = null;
  }
}
