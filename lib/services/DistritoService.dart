import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_final_tm/services/baseURL.dart';

Uri endpoint = Uri(
  scheme: scheme,
  host: host,
  path: '/api/Distrito',
);

Future<dynamic> getAll() async {

  final response = await http.get(endpoint);

  if (response.statusCode == 200){

    return jsonDecode(response.body);

  } else {
    throw Exception("No pudimos establecer conexion con la API. ${endpoint.host}${endpoint.path}, Response Code: ${response.statusCode}");
  }
}