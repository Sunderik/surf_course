import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';
import 'package:task_279830/core/theme/theme_constants.dart';

class ChequeAppBar extends StatelessWidget {
  final int chequeNumber;
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
      title: ChequeAppBarTitle(chequeNumber: chequeNumber, createdDate: createdDate),
      automaticallyImplyLeading: true,
    );
  }
}

class ChequeAppBarTitle extends StatelessWidget {
  final int chequeNumber;
  final DateTime createdDate;

  const ChequeAppBarTitle({super.key, required this.chequeNumber, required this.createdDate});

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
          style: textTheme.customTitleBold,
        ),
        Text(
          formattedDate,
          style: textTheme.customCaption,
        ),
      ],
    );
  }
}
