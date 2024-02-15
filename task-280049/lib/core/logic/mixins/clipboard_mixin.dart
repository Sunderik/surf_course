import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin ClipboardMixin {
  Future<String> getColorInClipboard() async {
    final data = (await Clipboard.getData(Clipboard.kTextPlain))?.text;
    if (data == null || data.isEmpty) {
      return '';
    } else {
      return data;
    }
  }

  Future<void> copyToClipboard(BuildContext context, {required String text, String? message}) async {
    await Clipboard.setData(ClipboardData(text: text));

    if (message != null && message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
          ],
        ),
      ));
    }
  }
}
