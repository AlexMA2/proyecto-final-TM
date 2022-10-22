import 'dart:io';

import 'package:flutter/material.dart';

class FormValueArgument {
  FormValueArgument(
      {required this.image,
      required this.dogBreed,
      required this.district,
      required this.petColor,
      required this.years,
      required this.months,
      required this.phoneNumber});

  File image;
  String dogBreed;
  String district;
  String petColor;
  int years;
  int months;
  String phoneNumber;
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(158, 42, 43, 1),
            elevation: 5,
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )),
    );
  }
}
