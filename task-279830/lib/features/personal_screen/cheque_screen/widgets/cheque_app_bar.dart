import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_279830/core/theme/color_constants.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

/// Виджет AppBar для экрана чека покупок
class ChequeAppBar extends StatelessWidget {
  /// Номер чека
  final int chequeNumber;

  /// Дата формирования чека
  final DateTime createdDate;

  const ChequeAppBar({super.key, required this.chequeNumber, required this.createdDate});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 24,
          color: customGreen,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: _ChequeAppBarTitle(chequeNumber: chequeNumber, createdDate: createdDate),
      automaticallyImplyLeading: true,
    );
  }
}

/// Виджет заголовка  в AppBar для экрана чека покупок
class _ChequeAppBarTitle extends StatelessWidget {
  /// Номер чека
  final int chequeNumber;

  /// Дата формирования чека
  final DateTime createdDate;

  const _ChequeAppBarTitle({required this.chequeNumber, required this.createdDate});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd.MM.yy в kk:mm').format(createdDate);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Чек №$chequeNumber',
          style: textTheme.customTitleBoldDark,
        ),
        Text(
          formattedDate,
          style: textTheme.customCaptionDark,
        ),
      ],
    );
  }
}
