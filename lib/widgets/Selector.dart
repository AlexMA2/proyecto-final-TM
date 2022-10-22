import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  Selector({super.key, required this.values, required this.valueSelected, required this.onChange  });
  final List<String> values;
  String valueSelected;
  final ValueChanged<String> onChange;
  @override
  State<Selector> createState() => SelectorState();
}

class SelectorState extends State<Selector> {
  late String _valueSelected = widget.valueSelected;
  @override
  Widget build (BuildContext context) {
    _valueSelected = widget.valueSelected;
    return Container(
        padding: const  EdgeInsets.all(8),
        decoration: BoxDecoration(
        color: Colors.white, //<-- SEE HERE
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(158, 42, 43, 1), width: 2.0),
        ),
        child: DropdownButton<String>(
          value: _valueSelected,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black, // <-- SEE HERE
          ),
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _valueSelected = value;
              });
              widget.onChange(value);
            }
          },
          dropdownColor: Colors.white,
          items: widget.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              );
          }).toList(),
        )
    );
  }
}