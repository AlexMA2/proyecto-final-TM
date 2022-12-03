import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;

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

Future<Mascotas> fetchMascotas() async {

  final response = await http
      .get(Uri.parse('https://09ec-190-236-35-34.sa.ngrok.io/api/Mascota'));

  if (response.statusCode == 200) {
    
    return Mascotas.fromJson(jsonDecode(response.body));
    
  } else {
    throw Exception('Error al traer las mascotas');
  }
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

class Mascotas {
  final int? mascotaId;
  final String? colorPelo;
  final int? anios;
  final int? meses;
  final String? imagen;
  final int? razaId;
  final int? usuarioId;
  final bool? encontrada;

  const Mascotas({
    required this.mascotaId,
    required this.colorPelo,
    required this.anios,
    required this.meses,
    required this.imagen,
    required this.razaId,
    required this.usuarioId,
    required this.encontrada
  });

  factory Mascotas.fromJson(List<dynamic> json) {
    return Mascotas(
      mascotaId   : json[0]['mascotaId'],
      colorPelo   : json[0]['colorPelo'],
      anios       : json[0]['anios'],
      meses       : json[0]['meses'],
      imagen      : json[0]['imagen'],
      razaId      : json[0]['razaId'],
      usuarioId   : json[0]['usuarioId'],
      encontrada  : json[0]['encontrada'],
    );
  }
}

class _MatchPetsState extends State<MatchPets> {

  late Future<Mascotas> futureMascotas;
  List<String> mascotasfetch = []; 

  @override
  void initState() {
    super.initState();
    futureMascotas = fetchMascotas();

    
    print(futureMascotas);
  }

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
      appBar: AppBar(
          title: const Text('PawClues'),
          automaticallyImplyLeading: false,
      ),
      endDrawer: const DrawerNav(),
      body: Container(
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
                  color: Colors.black
                ),
              ),
              )
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                'Las siguientes fotos fueron subidas por personas que reportan mascotas y una inteligencia artificial calcula la similitud de estas fotos con la foto y los datos proporcionados.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                )
              ),
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