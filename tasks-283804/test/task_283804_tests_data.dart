import 'package:task_283804/models.dart';

final _now = DateTime.now();

/// Пустая карта стран с их территориями.
final emptyMap = <Countries, List<Territory>>{};

/// Карта с [Countries.russia], 3 территориями, 5 уникальными машинами.
final mapWithSingleCountry1 = <Countries, List<Territory>>{
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

/// Карта с [Countries.russia], 1 территориями, 2 уникальными машинами.
final mapWithSingleCountry2 = <Countries, List<Territory>>{
  Countries.russia: [
    Territory(
      15,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
  ],
};

/// Карта с [Countries.brazil], 1 территориями, 2 уникальными машинами.
final mapWithSingleCountry3 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      15,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

/// Карта нескольких стран с территориями без дубликатов.
final mapCountriesWithoutTerritoryDuplicates = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

/// Карта нескольких стран с дубликатами территорий.
final mapCountriesWithTerritoryDuplicates = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      100,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

/// Список территорий с дублями сельхоз техники и без сортировки.
final territoryList = <Territory>[
  Territory(
    1,
    ['Культура 1'],
    [
      AgriculturalMachinery(
        'Каток Кирилл',
        DateTime(2018),
      ),
      AgriculturalMachinery(
        'Окучник Саша',
        DateTime(2010),
      ),
      AgriculturalMachinery(
        'Комбаин Василий',
        DateTime(1998),
      ),
    ],
  ),
  Territory(
    2,
    ['Культура 2'],
    [
      AgriculturalMachinery(
        'Гидравлический молот Лена',
        DateTime(2014),
      ),
      AgriculturalMachinery(
        'Мини-погрузчик Максим',
        DateTime(2011),
      ),
    ],
  ),
  Territory(
    3,
    ['Культура 3'],
    [
      AgriculturalMachinery(
        'Комбаин Василий',
        DateTime(1998),
      ),
      AgriculturalMachinery(
        'Окучник Саша',
        DateTime(2010),
      ),
    ],
  )
];

/// Список с четным кол-вом спецтехники отсортированный по увеличению возраста и без дублей.
///
/// Средний возраст 3
final machineriesEvenList = <AgriculturalMachinery>{
  AgriculturalMachinery(
    'Комбаин Василий',
    DateTime(_now.year - 5),
  ),
  AgriculturalMachinery(
    'Окучник Саша',
    DateTime(_now.year - 4),
  ),
  AgriculturalMachinery(
    'Мини-погрузчик Максим',
    DateTime(_now.year - 2),
  ),
  AgriculturalMachinery(
    'Каток Кирилл',
    DateTime(_now.year - 1),
  ),
};

/// Список с четным кол-вом спецтехники отсортированный по увеличению возраста и без дублей.
///
/// Средний возраст 4
final machineriesNonEvenList = <AgriculturalMachinery>{
  AgriculturalMachinery(
    'Комбаин Василий',
    DateTime(_now.year - 5),
  ),
  AgriculturalMachinery(
    'Мини-погрузчик Максим',
    DateTime(_now.year - 4),
  ),
  AgriculturalMachinery(
    'Каток Кирилл',
    DateTime(_now.year - 3),
  ),
};
