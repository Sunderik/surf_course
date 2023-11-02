/// Объект входных данных товара
class RawProductItem {
  /// Название
  final String name;

  /// Название категории
  final String categoryName;

  /// Название подкатегории
  final String subcategoryName;

  /// Срок годности
  final DateTime expirationDate;

  /// Кол-во на складе
  final int qty;

  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    this.qty = 0,
  });
}
