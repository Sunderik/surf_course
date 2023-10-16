import 'dart:math';

/// Описание стратегии выйгрыша
typedef Strategy = double Function(List<String> cardsOnDesk, List<String> cardsInHand);

class PokerPlayer {
  /// Список текущих карт в руке у игрока
  final List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double _surenessInWin = 0;

  /// Вычислить шансы на выигрыш
  void calculateProbabilities(
    List<String> cardOnDesk,

    /// Это часть первого задания. [Strategy] пока не существует.
    ///
    /// Опишите его.
    Strategy strategy,
  ) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

void main() {
  final opponent = PokerPlayer();

  /// Это часть первого задания. [Strategy] пока не существует.
  ///
  /// Опишите его.
  final Strategy fakeStrategy = (p0, p1) {
    // вывод карт игрока в консоль в соответвии с заданием
    p1.forEach((e) => print(e));
    // возврат шанса выйгрыша для выполнения услоий описания стратегии
    return Random().nextDouble() * 100;
  };

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'king of hearts'],
    fakeStrategy,
  );
}
