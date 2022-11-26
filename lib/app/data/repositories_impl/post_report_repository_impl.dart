

import 'package:proyecto_final_tm/app/domain/inputs/post_report.dart';
import 'package:proyecto_final_tm/app/domain/repositories/post_report_repository.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class postReportRepositoryImpl implements postReportRepository{


  @override
  Future<String> postReport(PostReportData data) async{

    final response = await http.post(
    Uri.parse('http://192.168.1.10:8000/apipost'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': 'ManuelCruz',
      'colorPelo':'colorPelo',
      'Años':data.anios,
      'Meses':data.meses,
      'RazaId':data.razaid,
      'encontrada':data.encontrado,
      'usuarioId':data.usuid,
      'file':data.image.readAsBytesSync(),
    }),
  );

    print(response);

    if (response.statusCode == 201) {
      
      print(response.body);

      return 'Mascota registrada con éxito';
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return 'Ha ocurrido un error';
    }

  }


}