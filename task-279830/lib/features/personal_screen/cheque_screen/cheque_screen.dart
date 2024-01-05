import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/cheque_bloc.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/cheque_view.dart';

/// Виджет обертка для экрана чека приложения
///
/// Связывает бизнес логику экрана и его интерфейс
class ChequeScreen extends StatelessWidget {
  const ChequeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ChequeBloc>(
      create: (ctx) => ChequeBloc()..init(),
      dispose: (ctx, bloc) => bloc.dispose(),
      child: const ChequeView(),
    );
  }
}
