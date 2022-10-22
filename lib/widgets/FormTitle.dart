import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/theme/ThemeColors.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: dark_red,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        )
    );
  }
}
