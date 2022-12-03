import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:proyecto_final_tm/app/ui/pages/home/home_page.dart';
import 'package:proyecto_final_tm/app/ui/pages/login/login_page.dart';
import 'package:proyecto_final_tm/app/ui/pages/mascotas/mascotas_page.dart';
import 'package:proyecto_final_tm/app/ui/pages/register/register_page.dart';
import 'package:proyecto_final_tm/app/ui/pages/splash/splash_page.dart';
import 'package:proyecto_final_tm/app/ui/routes/routes.dart';
import 'package:proyecto_final_tm/screens/principal.dart';

Map<String, Widget Function(BuildContext)> get AppRoutes => {

  // Routes.HOME: (_) => HomePage(),
  Routes.HOME: (_) => Principal(),
  Routes.SPLASH: (_) => SplashPage(),
  Routes.LOGIN: (_) => LoginPage(),
  Routes.REGISTER: (_) => RegisterPage(),
  Routes.MASCOTAS: (_) => MascotasPage()

};