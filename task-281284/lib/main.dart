import 'package:flutter/material.dart';
import 'package:task_281284/core/di/injectable.dart';
import 'package:task_281284/core/enteties/prediction.dart';
import 'package:task_281284/core/logic/fortune_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Ожидаем получения DI приложения
  await configureDependencyInjections();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Prediction>(
              future: injector.get<IFortuneRepository>().getPrediction(),
              builder: (BuildContext context, AsyncSnapshot<Prediction> snapshot) {
                return Text(snapshot.data?.reading ?? 'Тебе не повезло');
              }),
        ),
      ),
    );
  }
}
