import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/DrawerNav.dart';
import 'package:proyecto_final_tm/screens/Principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_final_tm/app/inject_dependencies.dart';
import 'package:proyecto_final_tm/app/my_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  injectDependencies();


  runApp(const MyApp());
  // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: const ColorScheme(
//           primary: Color(0xFF09E2A2B),
//           onBackground: Colors.white,
//           onError: Colors.yellow,
//           onSecondary: Colors.white,
//           onSurface: Colors.white,
//           background: Colors.yellow,
//           secondary: Colors.purple,
//           surface: Color(0xFF09E2A2B),
//           error: Colors.red,
//           onPrimary: Color(0xFF0A0E21),
//           brightness: Brightness.dark,
//         )
//       ),
//       home: const MyHomePage(title: 'PawClues'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {

//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         titleSpacing: 0,
//         title: Image(
//           image: AssetImage("assets/images/pawcluesletra.png"),
//           width: 120,
//           height: 120,
//         ),
//         automaticallyImplyLeading: false,
//       ),
//       endDrawer: DrawerNav(),
//       body: Principal(),
//     );
//   }
// }