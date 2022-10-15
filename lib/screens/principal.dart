import 'package:flutter/material.dart';
import 'MatchPets.dart';
import 'ReportAnimal.dart';
import 'SearchPet.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 243, 176, 1),
      body: Text('Principal'),
    );
  }
}