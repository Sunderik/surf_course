import 'package:flutter/material.dart';

extension ChequeAppBar on AppBarTheme {
  AppBarTheme get comfortTitle {
    return const AppBarTheme(
        centerTitle: true, backgroundColor: Colors.transparent, elevation: 0.0, iconTheme: IconThemeData());
  }
}
