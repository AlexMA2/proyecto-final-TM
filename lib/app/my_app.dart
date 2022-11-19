import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/app/ui/routes/app_routes.dart';
import 'package:proyecto_final_tm/app/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAWCLUES',
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
          onPrimary: Color.fromRGBO(255, 243, 176, 1),
          brightness: Brightness.light,
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      routes:AppRoutes,
    );
  }
}