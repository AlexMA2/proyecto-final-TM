import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/principal.dart';
import 'screens/MatchPets.dart';
import 'screens/ReportAnimal.dart';
import 'screens/SearchPet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF09E2A2B),
          onBackground: Colors.white,
          onError: Colors.yellow,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          background: Colors.yellow,
          secondary: Colors.purple,
          surface: Color(0xFF09E2A2B),
          error: Colors.red,
          onPrimary: Color(0xFF0A0E21),
          brightness: Brightness.dark,
        )
      ),
      home: const MyHomePage(title: 'PawClues'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Principal(),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
                height : 100.0, 
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: Text('Navegacion'),
                ),
            ),
            ListTile(
              leading: const Icon(
                Icons.report_gmailerrorred_outlined
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
                  Icons.search
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
                  Icons.pets
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
