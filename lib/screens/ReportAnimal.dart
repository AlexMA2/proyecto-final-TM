import 'dart:io';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_final_tm/app/domain/inputs/post_report.dart';


import 'package:proyecto_final_tm/screens/DrawerNav.dart';
import 'package:proyecto_final_tm/constants/SelectorsData.dart';

import 'package:proyecto_final_tm/theme/PawCluesInputTheme.dart';
import 'package:proyecto_final_tm/widgets/FormTitle.dart';
import 'package:proyecto_final_tm/widgets/Selector.dart';
import 'package:proyecto_final_tm/widgets/SubmitButton.dart';


Future<Razas> fetchRazas() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.10:8000/apiRazas'));

  if (response.statusCode == 200) {
    
    print(response.body);
    return Razas.fromJson(jsonDecode(response.body));

  } else {
    throw Exception('Error al traer las razas');
  }
}
Future<Distritos> fetchDistritos() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.10:8000/apiDistritos'));

  if (response.statusCode == 200) {
    
    print(response.body);
    return Distritos.fromJson(jsonDecode(response.body));
    
  } else {
    throw Exception('Error al traer los distritos');
  }
}


Future<String> postEnvio(String colorPelo, int anios, int meses, int razaid, bool encontrado, int usuid, File imagen) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.10:8000/apipost'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': 'ManuelCruz',
      'colorPelo':'colorPelo',
      'Años':anios,
      'Meses':meses,
      'RazaId':razaid,
      'encontrada':false,
      'usuarioId':usuid,
      'file':imagen.readAsBytesSync(),
    }),
  );

  print(response);

  if (response.statusCode == 201) {
    
    print(response.body);

    return 'OK';
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Razas {
  final int razaId;
  final String nombreRaza;
  final String imagen;

  const Razas({
    required this.razaId,
    required this.nombreRaza,
    required this.imagen,
  });

  factory Razas.fromJson(Map<String, dynamic> json) {
    return Razas(
      razaId    : json['razaId'],
      nombreRaza: json['nombreRaza'],
      imagen    : json['imagen'],
    );
  }
}

class Distritos {
  final int distritoId;
  final String nombreDistrito;

  const Distritos({
    required this.distritoId,
    required this.nombreDistrito,
  });

  factory Distritos.fromJson(Map<String, dynamic> json) {
    return Distritos(
      distritoId    : json['distritoId'],
      nombreDistrito: json['nombreDistrito'],
    );
  }
}




class ReportAnimalForm extends StatefulWidget {
  const ReportAnimalForm({super.key});
  @override
  State<ReportAnimalForm> createState() => ReportAnimalFormState();
}


class ReportAnimalFormState extends State<ReportAnimalForm> {

  @override
  void initState(){
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  File? image;
  Future pickImage() async {
    try {
      print('seleccionar imagen');
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      print('la imagen');
      print(image);
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

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: PawCluesInputTheme().theme()),
      home: Scaffold(

        backgroundColor: const Color.fromRGBO(255, 243, 176, 1),
        appBar: AppBar(
        titleSpacing: 0,
        title: const Image(
          image: AssetImage("assets/images/pawcluesletra.png"),
          width: 120,
          height: 120,
        ),
        automaticallyImplyLeading: false,
      ),
        endDrawer: DrawerNav(),
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
                  onPressed: () => 
                  {
                        if (_formKey.currentState!.validate())
                          {
                          // print(petColor)
                          // postEnvio(petColor, years, months, 1, false,1 , image!)
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

                      }
                      ,
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
