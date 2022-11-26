

import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pets extends StatefulWidget {
  const Pets({super.key});

  @override
  State<Pets> createState() => _PetsState();
}

Future<Mascotas> fetchMascotas() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.10:8000/apiMascotas'));

  if (response.statusCode == 200) {
    
    print(response.body);
    return Mascotas.fromJson(jsonDecode(response.body));
    
  } else {
    throw Exception('Error al traer las mascotas');
  }
}

class Mascotas {
  final int mascotaId;
  final String colorPelo;
  final int anios;
  final int meses;
  final String imagen;
  final int razaId;
  final int usuarioId;
  final bool encontrada;
  final Map usuario;
  final Map raza;

  const Mascotas({
    required this.mascotaId,
    required this.colorPelo,
    required this.anios,
    required this.meses,
    required this.imagen,
    required this.razaId,
    required this.usuarioId,
    required this.encontrada,
    required this.usuario,
    required this.raza
  });

  factory Mascotas.fromJson(Map<String, dynamic> json) {
    return Mascotas(
      mascotaId   : json['mascotaId'],
      colorPelo   : json['colorPelo'],
      anios       : json['anios'],
      meses       : json['meses'],
      imagen      : json['imagen'],
      razaId      : json['razaId'],
      usuarioId   : json['usuarioId'],
      encontrada  : json['encontrada'],
      usuario     : json['usuario'],
      raza        : json['raza'],
    );
  }
}

class _PetsState extends State<Pets> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}