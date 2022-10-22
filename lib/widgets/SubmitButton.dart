import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  const SubmitButton({super.key, this.formState, required this.goTo});

  final FormState? formState;
  final String goTo;

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(158, 42, 43, 1),
              elevation: 5,
            ),
            onPressed: () {
              if (formState != null && formState!.validate()) {
                // Si el formulario es válido, queremos mostrar un Snackbar
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
                Navigator.pushNamed(context, goTo, arguments : formState);
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('El formulario es incorrecto')));
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Enviar', style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
        ),
      );
  }
}