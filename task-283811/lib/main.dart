import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const String title = 'Counter v. 2.0';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Основной счетчик, не может опускаться ниже 0
  int _counter = 0;

  /// Переменная количества нажатий на кнопку увеличения счетчика
  int _totalIncrementTapsCount = 0;

  /// Переменная количества нажатий на кнопку уменьшения счетчика
  int _totalDecrementTapsCount = 0;

  /// Метод обработки нажатия на кнопку увеличения счетчика
  void _incrementCounter() {
    setState(() {
      _counter++;
      _totalIncrementTapsCount++;
    });
  }

  /// Метод обработки нажатия на кнопку уменьшения счетчика
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
      _totalDecrementTapsCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Текущее значение счетчика:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Нажатий на (+): '),
                      Text(_totalIncrementTapsCount.toString()),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Нажатий на (-): '),
                      Text(_totalDecrementTapsCount.toString()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            onPressed: _incrementCounter,
            tooltip: 'Прибавить',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            onPressed: _decrementCounter,
            tooltip: 'Отнять',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
