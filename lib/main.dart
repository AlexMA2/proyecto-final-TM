import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/MatchPets.dart';

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
        colorScheme: ColorScheme(
          primary: Color(0xFF09E2A2B),
          onBackground: Colors.white,
          onError: Colors.yellow,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          background: Colors.yellow,
          secondary: Colors.purple,
          surface: Color(0xFF09E2A2B),
          secondaryVariant: Colors.white,
          error: Colors.red,
          primaryVariant: Color(0xFF0A0E21),
          onPrimary: Color(0xFF0A0E21),
          brightness: Brightness.dark,
        )
      ),
      home: const MyHomePage(title: 'PawClues'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: const SingleChildScrollView(
        child: MatchPets(),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: Text('Header'),
            ),
            ListTile(
              leading: Icon(
                Icons.home
              ),
              title: const Text('Menu'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
