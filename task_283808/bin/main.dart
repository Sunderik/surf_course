import 'package:task_283808/lib.dart';

void main(List<String> arguments) {
  // Пример создания экземпляра класса менеджера по продажам и вывод этой информации в консоль.
  MarketingManager manager = MarketingManager(
    education: 'царском тереме',
    card: PassCard(
        id: 'G4G3G2G1-G6G5-G8G7-G9G10-G11G12G13G14G15G16',
        accessLevels: {AccessLevelsEnum.teamTrucks, AccessLevelsEnum.commandBridge, AccessLevelsEnum.headquarters}),
    brigade: Brigade(name: 'Русь', country: CountryEnum.russia),
    name: 'Иван',
    surname: 'Грозный',
    gender: GendersEnum.male,
    dateOfBirth: DateTime(1530, 8, 25),
    usedMarketingStrategies: ['Продавать всем и без скидок', 'Покупать всё по акции'],
    characteristics: ['Умный', 'Богатый', 'Мертвый'],
    salary: 1000000,
    uniform: 'Шапка Мономаха',
  )..printDescription();
}
