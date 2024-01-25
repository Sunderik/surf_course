import 'package:flutter/material.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/widgets/widgets.dart';

/// Виджет экрана чека приложения
///
/// Формирует интерфейс данного экрана
class ChequeView extends StatefulWidget {
  const ChequeView({super.key});

  @override
  State<ChequeView> createState() => _ChequeViewState();
}

/// Состояние виджета экрана чека приложения
class _ChequeViewState extends State<ChequeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        // Данные вбиты в код для удобства
        child: ChequeAppBar(
          chequeNumber: 56,
          createdDate: DateTime(2023, 2, 24, 12, 23),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ChequeProductsListHeader(),
              ChequeProductsList(),
              ChequeProductsListFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
