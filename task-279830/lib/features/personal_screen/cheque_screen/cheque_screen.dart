import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/widgets/cheque_app_bar.dart';

class ChequeScreen extends StatelessWidget {
  const ChequeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0), // here the desired height
          child: ChequeAppBar(chequeNumber: 56, createdDate: DateTime(2023, 2, 24, 12, 23))),
      body: Center(
        child: Text('Покупочки', style: Theme.of(context).textTheme.customSubtitle),
      ),
    );
  }
}
