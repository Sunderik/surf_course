import 'package:flutter/material.dart';

/// Перечисление экранов.
enum ScreensEnum {
  /// Корзина
  basket('Корзина', Icons.local_mall_outlined),

  /// Каталог
  catalog('Каталог', Icons.article_outlined),

  /// Чек
  cheque('Чек', null),

  /// Личное
  personal('Личное', Icons.person_outline),

  /// Поиск
  search('Поиск', Icons.search);

  /// Наименование экрана
  final String name;

  /// Иконка обозначающая экран
  final IconData? icon;

  const ScreensEnum(this.name, this.icon);
}
