import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:proyecto_final_tm/app/domain/repositories/authentication_repository.dart';
import 'package:proyecto_final_tm/app/ui/pages/mascotas/mascotas_page.dart';
import 'package:proyecto_final_tm/main.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:proyecto_final_tm/screens/ReportAnimal.dart';
import 'package:proyecto_final_tm/screens/SearchPet.dart';
import 'package:proyecto_final_tm/screens/MatchPets.dart';
import 'package:proyecto_final_tm/screens/principal.dart';

import '../app/ui/routes/routes.dart';
class DrawerNav extends StatefulWidget {

  const DrawerNav({super.key});

    @override
    State<DrawerNav> createState() => _DrawerNavState();
}

Future<Post> fetchPost() async {
  
  String urlDistritos = 'https://jsonplaceholder.typicode.com/posts/1';

  final response =
      await http.get(Uri.parse(urlDistritos));

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    // return Post.fromJson(json.decode(response.body));
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


class _DrawerNavState extends State<DrawerNav> {
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Drawer(
          child: Container(
            color: Color.fromARGB(255, 210, 204, 166),
            child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height : 150.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 109, 16, 20)
                  ),
                  child: Image(
                    image: AssetImage("assets/images/pawclueslogo.png")
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:0),
                color: Color.fromARGB(255, 109, 16, 20),
                child:
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'PawClues',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),
              ListTile(
                leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 30,
                ),
                title: const Text('Principal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  )),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Principal())
                    // MyHomePage(title: 'Principal')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.pets,
                    color: Colors.black,
                    size: 30,
                    
                ),
                title: const Text('Mascotas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MascotasPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                    
                ),
                title: const Text('Buscar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPetForm()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: Colors.black,
                    size: 30,
                ),
                title: const Text('Reportar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  )),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportAnimalForm()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.gps_fixed,
                    color: Colors.black,
                    size: 30,
                ),
                title: const Text('Match',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  )),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MatchPets()),
                  );
                },
              ),
              Container(
                color: Color.fromARGB(255, 109, 16, 20),
                width: 20,
                height: 50,
                child: CupertinoButton(
                  // color: const Color.fromARGB(255, 109, 16, 20),
                  child: const Text('Salir',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )
                  ),
                  onPressed: () async {
                    await Get.find<AuthenticationRepository>().signOut();
                    router.pushNamedAndRemoveUntil(Routes.LOGIN);
                  }
                ),
              )
              
            ],
          ),
          )
        ),
      );
    }
}