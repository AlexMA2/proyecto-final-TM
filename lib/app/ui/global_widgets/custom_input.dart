
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool isPassword;
  const CustomInputField({
    super.key,
    this.onChanged,
    this.inputType,
    required this.label,
    this.isPassword = false,
    this.validator
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  late bool _obscureText;

  @override
  void initState(){
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      initialValue: '',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: const TextStyle(color: Colors.black),
            obscureText: _obscureText,
            keyboardType: widget.inputType,
            onChanged: (text){
              if(widget.validator != null){
                state.setValue(text);
                state.validate();
              }
              if(widget.onChanged != null){
                widget.onChanged!(text);
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2, color: Color(0xFF09E2A2B),
                )
              ),
              labelText: widget.label,
              border: const OutlineInputBorder(),
              labelStyle: const TextStyle(color:Colors.black),
              suffixIcon: widget.isPassword ? CupertinoButton(
                child: Icon(_obscureText? Icons.visibility: Icons.visibility_off),
                onPressed: (){
                  _obscureText = !_obscureText;
                  setState(() {});
                },
              ):Container(
                width: 0,
              ),
            ),
          ),
          if(state.hasError)
            Text(
              state.errorText!,
              style: const TextStyle(color: Colors.redAccent),
            )
        ],
      );
    });
  }
}