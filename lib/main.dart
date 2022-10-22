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
      initialRoute: '/',
      routes: {
        '/': (context) => const Principal(title: "PawClues"),
        '/searchPet': (context) => const SearchPetForm(),
        '/reportPet':  (context) => const ReportAnimalForm(),
        '/matching':  (context) => const MatchPets(),
      },
    );
  }
}
