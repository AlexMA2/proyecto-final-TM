import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:proyecto_final_tm/screens/DrawerNav.dart';
import 'package:proyecto_final_tm/constants/SelectorsData.dart';


import 'package:proyecto_final_tm/theme/PawCluesInputTheme.dart';
import 'package:proyecto_final_tm/widgets/FormTitle.dart';
import 'package:proyecto_final_tm/widgets/Selector.dart';
import 'package:proyecto_final_tm/widgets/SubmitButton.dart';

class ReportAnimalForm extends StatefulWidget {
  const ReportAnimalForm({super.key});
  @override
  State<ReportAnimalForm> createState() => ReportAnimalFormState();
}

// Define una clase de estado correspondiente. Esta clase contendrá los datos
// relacionados con el formulario.
class ReportAnimalFormState extends State<ReportAnimalForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //

  final _formKey = GlobalKey<FormState>();
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final textStyle = const TextStyle(color: Colors.black);
  String selectedValueDogBreed = razas_perros.first;
  String selectedValueDistrictList = lista_distritos.first;
  String petColor = '';
  int years = 0;
  int months = 0;
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: PawCluesInputTheme().theme()),
      home: Scaffold(

        backgroundColor: const Color.fromRGBO(255, 243, 176, 1),
        appBar: AppBar(
          title: const Text('PawCluess'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(32.0),
            children: <Widget>[
              const FormTitle(title: '¡Reporta al animal!'),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Escoger imagen",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    pickImage();
                  }),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                    labelText: 'Color de Pelo',
                    helperText: "",
                    hintText: "Color de Pelo"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      style: textStyle,
                      decoration: const InputDecoration(
                          labelText: 'Años estimados',
                          helperText: "",
                          hintText: "Años estimados"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Este campo es importante';
                        }
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      style: textStyle,
                      decoration: const InputDecoration(
                          labelText: 'Meses estimados',
                          helperText: "",
                          hintText: "Meses estimados"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Este campo es importante';
                        }
                      },
                    ),
                  )
                ],
              ),
              Selector(
                values: razas_perros,
                valueSelected: selectedValueDogBreed,
                onChange: (value) =>
                    {setState(() => selectedValueDogBreed = value)},
              ),
              Selector(
                values: lista_distritos,
                valueSelected: selectedValueDistrictList,
                onChange: (value) =>
                    {setState(() => selectedValueDistrictList = value)},
              ),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                    labelText: 'Número de Contacto',
                    helperText: "",
                    hintText: "Número de Contacto"),
              ),
              SubmitButton(
                  onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            _formKey.currentState!.save(),
                            Navigator.pushNamed(context, '/matching',
                                arguments: FormValueArgument(
                                    image: image!,
                                    district: selectedValueDistrictList,
                                    dogBreed: selectedValueDogBreed,
                                    years: years,
                                    months: months,
                                    petColor: petColor,
                                    phoneNumber: phoneNumber))
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('El formulario es incorrecto')))
                          }
                      },
                  label: 'Reportar'),
            ]
                .map((child) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: child,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
