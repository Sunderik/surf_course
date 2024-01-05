import 'dart:async';

import 'package:task_279830/core/domain/entities/product_entity.dart';
import 'package:task_279830/core/domain/enums/sorting_types_enum.dart';

/// Объект для взаимодействия с сортировкой списка продуктов.
mixin ProductsListSortingMixin {
  /// Выбранный тип сортировки
  late SortingTypesEnum _selectedSortingType;

  /// Выбранный тип сортировки
  SortingTypesEnum get selectedSortingType => _selectedSortingType;

  /// Контроллер для работы с выбранным типом сортировки.
  StreamController<SortingTypesEnum>? _selectedSortingTypeController;

  /// Поток контроллера для для работы с выбранным типом сортировки.
  Stream<SortingTypesEnum>? get selectedSortingTypeStream => _selectedSortingTypeController?.stream;

  /// Условие проверки, наличия сортировки применяемой к списку покупок.
  bool get sortingIsUsed => _selectedSortingType != SortingTypesEnum.none;

  /// Инициализации объектов для работы с сортировкой
  void sortingMixinInit() {
    _selectedSortingType = SortingTypesEnum.none;
    _selectedSortingTypeController = StreamController<SortingTypesEnum>.broadcast();
  }

  /// Очистка объектов для работы с сортировкой
  void sortingMixinDispose() {
    _selectedSortingTypeController?.close();
  }

  /// Изменить текущий тип сортировки на тот что указан в [newType].
  void changeSelectedSortingType(SortingTypesEnum newType) {
    _sinkSelectedSortingType(newType);
  }

  /// Отсортировать продукты из [products], в соответствии с текущим [selectedSortingType] типом сортировки/
  List<ProductEntity> sortBySortingType(List<ProductEntity> products) {
    List<ProductEntity> result = List.from(products);
    switch (selectedSortingType) {
      case SortingTypesEnum.byName:
        {
          result.sort((a, b) => a.title.compareTo(b.title));
          break;
        }
      case SortingTypesEnum.byNameRevers:
        {
          result.sort((a, b) => a.title.compareTo(b.title));
          result = result.reversed.toList();
          break;
        }
      case SortingTypesEnum.byType:
        {
          result.sort((a, b) => a.category.name.compareTo(b.category.name));
          break;
        }
      case SortingTypesEnum.byTypeRevers:
        {
          result.sort((a, b) => a.category.name.compareTo(b.category.name));
          result = result.reversed.toList();
          break;
        }
      case SortingTypesEnum.byCost:
        {
          result.sort((a, b) => a.price.compareTo(b.price));

          break;
        }
      case SortingTypesEnum.byCostRevers:
        {
          result.sort((a, b) => a.price.compareTo(b.price));
          result = result.reversed.toList();
          break;
        }
      case SortingTypesEnum.none:
      default:
        {
          break;
        }
    }
    return result;
  }

  /// Отправить сигнал контроллеру об изменении типа сортировки на [sortingType].
  void _sinkSelectedSortingType(SortingTypesEnum sortingType) {
    _selectedSortingType = sortingType;
    _selectedSortingTypeController?.sink.add(sortingType);
  }
}
