import 'package:flutter/material.dart';
const InputDecoration inputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(158, 42, 43, 1), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
  hintText: '',
  hintStyle: TextStyle(
      color: Color.fromRGBO(0, 0, 0, 1)
  ),
  labelText: 'Color de Pelo',
  labelStyle: TextStyle(
    color: Color.fromRGBO(158, 42, 43, 1), //<-- SEE HERE
  ),
);