import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/DrawerNav.dart';
import 'package:proyecto_final_tm/screens/MatchPets/MatchPet.dart';
import 'package:proyecto_final_tm/screens/ReportAnimal.dart';
import 'package:proyecto_final_tm/screens/SearchPet.dart';

class MatchPets extends StatefulWidget {
  const MatchPets({super.key});

  @override
  State<MatchPets> createState() => _MatchPetsState();
}

class Quote {

  String imagen;
  String distrito;
  String direccion;

  Quote({
    required this.imagen,
    required this.distrito,
    required this.direccion 
  });
}

class _MatchPetsState extends State<MatchPets> {
  @override
  Widget build(BuildContext context) {


    List<Quote> matchPerros = [
      Quote( imagen: 'https://estaticos.muyinteresante.es/uploads/images/gallery/6124cf315cafe8c3101f8bab/perro_redes.jpg', distrito: 'Comas', direccion: 'A la altura de la RENIEC, junto al emolientero'),
      Quote( imagen: 'https://phantom-marca.unidadeditorial.es/906608716f6bb8870dcbcbafb7d0ae55/resize/828/f/webp/assets/multimedia/imagenes/2022/02/24/16456899624763.jpg', distrito: 'Breña', direccion: 'Cerca de la estacion del metropolitano'),
    ];

    List<Map<String, String>> mascotas = [
      {"imagen": "https://estaticos.muyinteresante.es/uploads/images/gallery/6124cf315cafe8c3101f8bab/perro_redes.jpg", "distrito": "Comas", "direccion": "A la altura de la RENIEC, junto al emolientero"},
      {"imagen": "https://phantom-marca.unidadeditorial.es/906608716f6bb8870dcbcbafb7d0ae55/resize/828/f/webp/assets/multimedia/imagenes/2022/02/24/16456899624763.jpg", "distrito": "Breña", "direccion": "Cerca de la estacion del metropolitano"}
    ];

    int cantidadMatch = matchPerros.length;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 243, 176, 1),
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('PawClues'),
      ),
      endDrawer: const DrawerNav(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/patitas.jpg"),fit: BoxFit.cover,)
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(25.0),
              child: const Center(
                child: Text(
                  '¿Esta es tu mascota?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.yellow
                ),
              ),
              )
            ),
            Container(
              margin: const EdgeInsets.all(25.0),
              child: const Text(
                'Las siguientes fotos fueron subidas por personas que reportan mascotas y una inteligencia artificial calcula la similitud de estas fotos con la foto y los datos proporcionados.',
                textAlign: TextAlign.center,
                style: TextStyle( color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            ...matchPerros.map((e) => MatchPet(datos : e)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,right:20),
                  child: TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF09E2A2B))),
                    onPressed: (){},
                    child: const Text(
                      'ATRAS',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 20,right:20),
                  child: TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff09e2a2b))),
                    onPressed: (){},
                    child: const Text(
                      'SALTAR',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 20,right:20),
                  child: TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF09E2A2B))),
                    onPressed: (){},
                    child: const Text(
                      'SIGUIENTE',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}