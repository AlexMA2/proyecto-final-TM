

import 'package:proyecto_final_tm/app/domain/inputs/post_report.dart';

abstract class postReportRepository{


  Future<String> postReport(PostReportData data);
  
}