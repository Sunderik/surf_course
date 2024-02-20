import 'package:injectable/injectable.dart';
import 'package:task_280049/core/logic/objects/dtos/color_dto.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';

/// Маппер сущностей [ColorEntity] из объектов [ColorDto]
@singleton
final class ColorMapper {
  /// Маппер для списка цветов
  List<ColorEntity> mapColors(List<ColorDto> data) {
    final mappedList = <ColorEntity>[];
    for (var e in data) {
      final entity = _mapColor(e);
      if (entity != null) mappedList.add(entity);
    }
    return mappedList;
  }

  /// Маппер [ColorEntity] из [ColorData]
  ColorEntity? _mapColor(ColorDto data) {
    final value = data.value;
    if (value == null) return null;

    return ColorEntity(data.name, value);
  }
}
