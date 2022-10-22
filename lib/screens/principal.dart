import 'package:flutter/material.dart';
import 'MatchPets.dart';
import 'ReportAnimal.dart';
import 'SearchPet.dart';

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});
  final String title;
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        title: Text(widget.title),
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
    );
  }
}