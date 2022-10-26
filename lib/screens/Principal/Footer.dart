import 'package:flutter/material.dart';


class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).size.width * 0.20,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 234, 231, 231),
                  border: Border.all(color: Colors.black, width: 3)
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '168',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              const Text(
                'Mascotas registradas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 234, 231, 231),
                  border: Border.all(color: Colors.black, width: 3)
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '127',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              const Text(
                'Mascotas encontradas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 232, 231, 234),
                  border: Border.all(color: Colors.black, width: 3)
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '211',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              const Text(
                'Usuarios PawClues',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}