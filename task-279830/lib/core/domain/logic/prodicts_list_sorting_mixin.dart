import 'dart:async';

import 'package:task_279830/core/domain/objects/sorting_type.dart';

/// Объект для взаимодействия с сортировкой списка продуктов.
mixin ProductsListSortingMixin {
  /// Выбранный тип сортировки
  late SortingType _selectedSortingType;

  /// Выбранный тип сортировки
  SortingType get selectedSortingType => _selectedSortingType;

  /// Контроллер для работы с выбранным типом сортировки.
  StreamController<SortingType>? _selectedSortingTypeController;

  /// Поток контроллера для для работы с выбранным типом сортировки.
  Stream<SortingType>? get selectedSortingTypeStream => _selectedSortingTypeController?.stream;

  /// Условие проверки, наличия сортировки применяемой к списку покупок.
  bool get sortingIsUsed => _selectedSortingType is! WithoutSorting;

  /// Инициализации объектов для работы с сортировкой
  void sortingMixinInit() {
    _selectedSortingType = WithoutSorting();
    _selectedSortingTypeController = StreamController<SortingType>.broadcast();
  }

  /// Очистка объектов для работы с сортировкой
  void sortingMixinDispose() {
    _selectedSortingTypeController?.close();
  }

  /// Изменить текущий тип сортировки на тот что указан в [newType].
  void changeSelectedSortingType(SortingType newType) {
    _sinkSelectedSortingType(newType);
  }

  // /// Отсортировать продукты из [products], в соответствии с текущим [selectedSortingType] типом сортировки/
  // List<ProductEntity> sortBySortingType(List<ProductEntity> products) {
  //   List<ProductEntity> result = List.from(products);
  //   switch (selectedSortingType) {
  //     case SortingTypesEnum.byName:
  //       {
  //         result.sort((a, b) => a.title.compareTo(b.title));
  //       }
  //     case SortingTypesEnum.byNameRevers:
  //       {
  //         result.sort((a, b) => a.title.compareTo(b.title));
  //         result = result.reversed.toList();
  //       }
  //     case SortingTypesEnum.byType:
  //       {
  //         result.sort((a, b) => a.category.name.compareTo(b.category.name));
  //       }
  //     case SortingTypesEnum.byTypeRevers:
  //       {
  //         result.sort((a, b) => a.category.name.compareTo(b.category.name));
  //         result = result.reversed.toList();
  //       }
  //     case SortingTypesEnum.byCost:
  //       {
  //         result.sort((a, b) => a.price.compareTo(b.price));
  //       }
  //     case SortingTypesEnum.byCostRevers:
  //       {
  //         result.sort((a, b) => a.price.compareTo(b.price));
  //         result = result.reversed.toList();
  //       }
  //     case SortingTypesEnum.none:
  //   }
  //   return result;
  // }

  /// Отправить сигнал контроллеру об изменении типа сортировки на [sortingType].
  void _sinkSelectedSortingType(SortingType sortingType) {
    _selectedSortingType = sortingType;
    _selectedSortingTypeController?.sink.add(sortingType);
  }
}
