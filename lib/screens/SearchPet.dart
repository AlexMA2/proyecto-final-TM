import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_final_tm/screens/DrawerNav.dart';
import 'MatchPets.dart';
import 'ReportAnimal.dart';
const List<String> razas_perros = <String>[ 'Sin raza', 'Affenpinscher', 'Afghan Hound', 'African Hunting Dog', 'Airedale Terrier', 'Akbash Dog', 'Akita', 'Alapaha Blue Blood Bulldog', 'Alaskan Husky', 'Alaskan Malamute', 'American Bulldog', 'American Bully', 'American Eskimo Dog', 'American Eskimo Dog (Miniature)', 'American Foxhound', 'American Pit Bull Terrier', 'American Staffordshire Terrier', 'American Water Spaniel', 'Anatolian Shepherd Dog', 'Appenzeller Sennenhund', 'Australian Cattle Dog', 'Australian Kelpie', 'Australian Shepherd', 'Australian Terrier', 'Azawakh', 'Barbet', 'Basenji', 'Basset Bleu de Gascogne', 'Basset Hound', 'Beagle', 'Bearded Collie', 'Beauceron', 'Bedlington Terrier', 'Belgian Malinois', 'Belgian Tervuren', 'Bernese Mountain Dog', 'Bichon Frise', 'Black and Tan Coonhound', 'Bloodhound', 'Bluetick Coonhound', 'Boerboel', 'Border Collie', 'Border Terrier', 'Boston Terrier', 'Bouvier des Flandres', 'Boxer', 'Boykin Spaniel', 'Bracco Italiano', 'Briard', 'Brittany', 'Bull Terrier', 'Bull Terrier (Miniature)', 'Bullmastiff', 'Cairn Terrier', 'Cane Corso', 'Cardigan Welsh Corgi', 'Catahoula Leopard Dog', 'Caucasian Shepherd (Ovcharka)', 'Cavalier King Charles Spaniel', 'Chesapeake Bay Retriever', 'Chinese Crested', 'Chinese Shar-Pei', 'Chinook', 'Chow Chow', 'Clumber Spaniel', 'Cocker Spaniel', 'Cocker Spaniel (American)', 'Coton de Tulear', 'Dalmatian', 'Doberman Pinscher', 'Dogo Argentino', 'Dutch Shepherd', 'English Setter', 'English Shepherd', 'English Springer Spaniel', 'English Toy Spaniel', 'English Toy Terrier', 'Eurasier', 'Field Spaniel', 'Finnish Lapphund', 'Finnish Spitz', 'French Bulldog', 'German Pinscher', 'German Shepherd Dog', 'German Shorthaired Pointer', 'Giant Schnauzer', 'Glen of Imaal Terrier', 'Golden Retriever', 'Gordon Setter', 'Great Dane', 'Great Pyrenees', 'Greyhound', 'Griffon Bruxellois', 'Harrier', 'Havanese', 'Irish Setter', 'Irish Terrier', 'Irish Wolfhound', 'Italian Greyhound', 'Japanese Chin', 'Japanese Spitz', 'Keeshond', 'Komondor', 'Kooikerhondje', 'Kuvasz', 'Labrador Retriever', 'Lagotto Romagnolo', 'Lancashire Heeler', 'Leonberger', 'Lhasa Apso', 'Maltese', 'Miniature American Shepherd', 'Miniature Pinscher', 'Miniature Schnauzer', 'Newfoundland', 'Norfolk Terrier', 'Norwich Terrier', 'Nova Scotia Duck Tolling Retriever', 'Old English Sheepdog', 'Olde English Bulldogge', 'Papillon', 'Pekingese', 'Pembroke Welsh Corgi', 'Perro de Presa Canario', 'Pharaoh Hound', 'Plott', 'Pomeranian', 'Poodle (Miniature)', 'Poodle (Toy)', 'Pug', 'Puli', 'Pumi', 'Rat Terrier', 'Redbone Coonhound', 'Rhodesian Ridgeback', 'Rottweiler', 'Russian Toy', 'Saint Bernard', 'Saluki', 'Samoyed', 'Schipperke', 'Scottish Deerhound', 'Scottish Terrier', 'Shetland Sheepdog', 'Shiba Inu', 'Shih Tzu', 'Shiloh Shepherd', 'Siberian Husky', 'Silky Terrier', 'Smooth Fox Terrier', 'Soft Coated Wheaten Terrier', 'Spanish Water Dog', 'Spinone Italiano', 'Staffordshire Bull Terrier', 'Standard Schnauzer', 'Swedish Vallhund', 'Thai Ridgeback', 'Tibetan Mastiff', 'Tibetan Spaniel', 'Tibetan Terrier', 'Toy Fox Terrier', 'Treeing Walker Coonhound', 'Vizsla', 'Weimaraner', 'Welsh Springer Spaniel', 'West Highland White Terrier', 'Whippet', 'White Shepherd', 'Wire Fox Terrier', 'Wirehaired Pointing Griffon', 'Wirehaired Vizsla', 'Xoloitzcuintli', 'Yorkshire Terrier' ];

const List<String> lista_distritos = <String>[
  "ANCON",
  "ATE",
  "BARRANCO",
  "BREÑA",
  "CARABAYLLO",
  "CHACLACAYO",
  "CHORRILLOS",
  "CIENEGUILLA",
  "COMAS",
  "EL AGUSTINO",
  "EL AGUSTINO",
  "INDEPENDENCIA",
  "JESUS MARIA",
  "LA MOLINA",
  "LA VICTORIA",
  "LIMA",
  "LINCE",
  "LOS OLIVOS",
  "LURIGANCHO",
  "LURIN",
  "MAGDALENA DEL MAR",
  "MIRAFLORES",
  "PACHACAMAC",
  "PUCUSANA",
  "PUEBLO LIBRE",
  "PUENTE PIEDRA",
  "PUNTA HERMOSA",
  "PUNTA NEGRA",
  "RIMAC",
  "SAN BARTOLO",
  "SAN BORJA",
  "SAN ISIDRO",
  "SAN JUAN DE LURIGANCHO",
  "SAN JUAN DE MIRAFLORES",
  "SAN LUIS",
  "SAN MARTIN DE PORRES",
  "SAN MIGUEL",
  "SANTA ANITA",
  "SANTA MARIA DEL MAR",
  "SANTA ROSA",
  "SANTIAGO DE SURCO",
  "SURQUILLO",
  "VILLA EL SALVADOR",
  "VILLA MARIA DEL TRIUNFO"
];

class SearchPetForm extends StatefulWidget {
  const SearchPetForm({super.key, required this.title});

  final String title;

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

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    String dropdownValue = razas_perros.first;
    String dropdownValueDistritos = lista_distritos.first;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 243, 176, 1),
        key: _formKey,
        appBar: AppBar(
          title: Text('PawClues'),
          automaticallyImplyLeading: false,
        ),
        endDrawer: const DrawerNav(),
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
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(62, 16, 17, 1)),
                  ),
                  labelText: 'Nombre de Tu Mascota',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(62, 16, 17, 1), //<-- SEE HERE
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(62, 16, 17, 1)),
                  ),
                  labelText: 'Color de Pelo',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(62, 16, 17, 1), //<-- SEE HERE
                  ),
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(62, 16, 17, 1)),
                  ),
                  labelText: 'Años',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(62, 16, 17, 1), //<-- SEE HERE
                  ),
                ),keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(62, 16, 17, 1)),
                  ),
                  labelText: 'Meses',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(62, 16, 17, 1), //<-- SEE HERE
                  ),
                ),keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Este campo es importante';
                  }
                },
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: razas_perros.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: dropdownValueDistritos,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: lista_distritos.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.

                    if (_formKey.currentState!.validate()) {
                      // Si el formulario es válido, queremos mostrar un Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        )
    );

  }
}