

import 'dart:io';

class PostReportData{

  final String colorPelo;
  final int anios;
  final int meses;
  final int razaid;
  final bool encontrado;
  final int usuid;
  final File image;
  
  PostReportData({
    required this.colorPelo,
    required this.anios,
    required this.meses,
    required this.razaid,
    required this.encontrado,
    required this.usuid,
    required this.image
  });
}