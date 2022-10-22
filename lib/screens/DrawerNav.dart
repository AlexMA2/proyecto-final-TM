import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/main.dart';
import 'package:proyecto_final_tm/screens/Principal.dart';

import 'package:proyecto_final_tm/screens/ReportAnimal.dart';
import 'package:proyecto_final_tm/screens/SearchPet.dart';
import 'package:proyecto_final_tm/screens/MatchPets.dart';
class DrawerNav extends StatefulWidget {
  const DrawerNav({super.key});

    @override
    State<DrawerNav> createState() => _DrawerNavState();
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
              Container(
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
              const SizedBox(
                height : 100.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo-PawClues.png"),
                    ),
                    color: Color.fromARGB(255, 109, 16, 20)
                  ),
                  child: Text(''),
                ),
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
                    MaterialPageRoute(builder: (context) => const
                    MyHomePage(title: 'Principal')),
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
                    MaterialPageRoute(builder: (context) => const SearchPetForm(title: 'Buscar')),
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
                    MaterialPageRoute(builder: (context) => const ReportAnimalForm()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                    Icons.pets,
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
            ],
          ),
          )
        ),
      );
    }
}