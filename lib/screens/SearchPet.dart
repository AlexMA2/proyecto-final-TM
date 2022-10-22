import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_final_tm/constants/SelectorsData.dart';
import 'package:proyecto_final_tm/widgets/Selector.dart';
import 'package:proyecto_final_tm/widgets/SubmitButton.dart';
import 'MatchPets.dart';
import 'ReportAnimal.dart';
import 'package:proyecto_final_tm/theme/InputDecoration.dart';


class SearchPetForm extends StatefulWidget {
  const SearchPetForm({super.key});
  @override
  State<SearchPetForm> createState() => SearchPetFormState();
}


// Define una clase de estado correspondiente. Esta clase contendrá los datos
// relacionados con el formulario.
class SearchPetFormState extends State<SearchPetForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //

  final _formKey = GlobalKey<FormState>();
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  final textStyle = const TextStyle(color: Colors.black);
  String selectedValueDogBreed = razas_perros.first;
  String selectedValueDistrictList = lista_distritos.first;
  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 243, 176, 1),
        key: _formKey,
        appBar: AppBar(
          title: const Text('PawClues'),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.red
                ),
                child: Text('Navegacion'),
              ),
              ListTile(
                leading: const Icon(
                    Icons.home
                ),
                title: const Text('Reportar '),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportAnimalForm()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.home
                ),
                title: const Text('Buscar '),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPetForm()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.home
                ),
                title: const Text('Match'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MatchPets()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                  "¡Busca a tu mascota!",
                  style: TextStyle(
                      color: Color.fromRGBO(84, 11, 14, 1), fontWeight: FontWeight.bold, fontSize: 30.0
                  )
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickImage();
                  }
              ),
              TextFormField(
                style: textStyle,
                decoration: inputDecoration,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              TextFormField(
                style: textStyle,
                decoration: inputDecoration,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              TextFormField(
                style: textStyle,
                decoration: inputDecoration,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              TextFormField(
                style: textStyle,
                decoration: inputDecoration,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              Selector(
                  values: razas_perros,
                  valueSelected: selectedValueDogBreed,
                  onChange: (value) => { setState(() => selectedValueDogBreed = value)},
              ),
              Selector(
                  values: lista_distritos,
                  valueSelected: selectedValueDistrictList,
                  onChange: (value) => {setState(() => selectedValueDistrictList = value)},
              ),
              SubmitButton(formState: _formKey.currentState, goTo: '/matching')
            ],
          ),
        )
    );

  }
}