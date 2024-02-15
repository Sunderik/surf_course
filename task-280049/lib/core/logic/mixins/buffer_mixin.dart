import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin BufferMixin {
  void copyToBuffer(BuildContext context, {required String text, required String message}) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
          ],
        ),
      ));
    });
  }
}
