import 'package:task_283805/mixins/smart_tools_mixin.dart';
import 'package:task_283805/models/models.dart';

/// Объект массажного кресла
class MassageChair extends Chair with SmartToolsMixin {
  MassageChair(
    super.name,
    super.description,
    super.size,
    super.backrestTilt, {
    required super.guid,
    required super.materials,
    required super.features,
    required super.weight,
    required super.legsCount,
  });
}
