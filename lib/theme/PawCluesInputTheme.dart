import 'package:flutter/material.dart';

class PawCluesInputTheme {
  InputDecorationTheme theme() => const InputDecorationTheme(
      contentPadding: EdgeInsets.all(16.0),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      constraints: BoxConstraints(maxWidth: 150),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(158, 42, 43, 1), width: 2.0),
      ),
      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
      labelStyle: TextStyle(
        color: Color.fromRGBO(158, 42, 43, 1), //<-- SEE HERE
      ));
}
