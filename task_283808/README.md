# Description of your result

Выполнение задания `Спорт это классно!`

## Description

В рамках задания создал структуру взаимосвязанных классов, приближенно соответсвующую составу команды/бригады из Формулы

1.

Для объектов участников команды создана иерархия классов в выводом общих свойств и переопределением метода выводи
информации о них.
Все модели и свойства подписаны и задокументированы, есть пустые модели для придания объема и наглядности работе, но
заполнить их все не имело смысла.

## How to

Чтобы запустить программу не из IDE, нужно в терминале перейти в директорию задания и ввести `dart run bin/main.dart`.

## Problems

Придумать адекватный пример, и найти кучу времени сделать все красиво по заветам ООА.

## More

Создана диаграмма классов для наглядности и понимания работы. 

В корневом файле `main` создан пример с заполнением модели
менеджера по продажам информацией и выводом его описания. 

Реализован вывод описания класса наследника, с учетом описания
класса родителя, т.е чем ниже по иерархии клас тем больше информации о себе он выведет.

Реализовано переопределение методов вывода описания для
моделей: `Human`=>`MemberOfBrigade`=>`Support`=>`MarketingManager`

## Example output
```
Человек:
ФИО: Иван Грозный
Пол: Мужчина
Дата рождения: 1530-08-25 00:00:00.000

Член бригады:
Бригада: Русь
Зарплата: 1000000.00 рублей.
Ходит в Шапка Мономаха
Пропуск {G4G3G2G1-G6G5-G8G7-G9G10-G11G12G13G14G15G16}:
	 Уровень 5 [Синий]: с доступом к Трак
	 Уровень 4 [Фиолетовый]: с доступом к Мостик
	 Уровень 3 [Зеленый]: с доступом к Штаб



Обучался в царском тереме.
Обладает следующими качествами:
	 Умный
	 Богатый
	 Мертвый

Роль: Менеджер по маркетингу.
Использует стратегии:
	 Продавать всем и без скидок
	 Покупать всё по акции

```