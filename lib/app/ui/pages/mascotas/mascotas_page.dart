import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/DrawerNav.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MascotasPage extends StatefulWidget {
  const MascotasPage({super.key});

  @override
  State<MascotasPage> createState() => _MascotasPageState();
}

Future<Mascotas> fetchMascotas() async {

  final response = await http
      .get(Uri.parse('http://192.168.1.13:8000/apitestdos'));

  if (response.statusCode == 200) {

    print(response.body);
    
    // return Mascotas.fromJson(jsonDecode(response.body));
    return jsonDecode(response.body);
    
  } else {
    throw Exception('Error al traer las mascotas');
  }
}

class Mascotas {
  final int? mascotaId;
  final String? colorPelo;
  final int? anios;
  final int? meses;
  final String? imagen;
  final int? razaId;
  final int? usuarioId;
  final int? encontrada;

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


class _MascotasPageState extends State<MascotasPage> {

  // var futureMascotas;
  late Future<Mascotas> futureMascotas;

  @override
  void initState(){
    super.initState();

    futureMascotas = fetchMascotas();

    
    print(futureMascotas);

    // print(futureMascota);

  }

  fetchMascotasData() async{
    var url;

    url = await http.get(Uri.parse('http://192.168.1.13:8000/apitestdos'));

    return jsonDecode(url.body);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 176, 1),
      endDrawer: DrawerNav(),
      appBar: AppBar(
        titleSpacing: 0,
        title: const Image(
          image: AssetImage("assets/images/pawcluesletra.png"),
          width: 120,
          height: 120,
        ),
        automaticallyImplyLeading: false,
      ),
      body:
      // FutureBuilder(
      //   future: fetchMascotasData(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot){
      //     if(snapshot.hasError){
      //       return Center(
      //         child: Text(snapshot.error),
      //       );
      //     }

      //     if(snapshot.hasData){
      //       return ListView.builder(
      //         itemBuilder: (BuildContext context, int index){
                
      //           return Row(
      //             children: [
      //               Container(
      //                 child: Text('texto'),
      //               )
      //             ]
      //           )
      //         }
      //       );
      //     }
      //   }
      //   )
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mascotas reportadas',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 109, 16, 20),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 175,
                margin: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  bottom: 10,
                  right: 5,
                ),
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                  bottom: 10,
                  right: 5,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg2J424mQ5NwNswvO2b5h1wA4QQTwJ42thuQ&usqp=CAU'),
                      ),
                    ),
                    Text('Nombre: Rayo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                    CupertinoButton(
                      color: Color.fromARGB(255, 109, 16, 20),
                      onPressed: () => {},
                      child: const Text('Ver',
                        style: TextStyle(
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                    )
                  ],
                )
              ),
              Spacer(),
              Container(
                width: 175  ,
                margin: EdgeInsets.only(
                  left: 5,
                  top: 5,
                  bottom: 10,
                  right: 10,
                ),
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                  bottom: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN4HJhnJo07reTM0Lta1HoTollHloqsqRUVw&usqp=CAU'),
                      ),
                    ),
                    Text('Nombre: Paco',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                    CupertinoButton(
                      color: Color.fromARGB(255, 109, 16, 20),
                      onPressed: () => {},
                      child: const Text('Ver',
                        style: TextStyle(
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}