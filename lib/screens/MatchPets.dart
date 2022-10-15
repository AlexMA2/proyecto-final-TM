import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/MatchPets/MatchPet.dart';

class MatchPets extends StatefulWidget {
  const MatchPets({super.key});

  @override
  State<MatchPets> createState() => _MatchPetsState();
}

class _MatchPetsState extends State<MatchPets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/patitas.jpg"), fit: BoxFit.cover,)
      ),
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                '¿Esta es tu mascota?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white
              ),
            ),
            ),
            Container(
              margin: const EdgeInsets.all(25.0),
              child: const Text(
                'Las siguientes fotos fueron subidas por personas que reportan mascotas y una inteligencia artificial calcula la similitud de estas fotos con la foto y los datos proporcionados.',
                textAlign: TextAlign.center,
                style: TextStyle( color: Colors.white)),
            ),
            const MatchPet(),
            const MatchPet(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,right:20),
                  child: TextButton(
                    child: const Text(
                      'ATRAS',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF09E2A2B))),
                    onPressed: (){},
                  )
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 20,right:20),
                  child: TextButton(
                    child: const Text(
                      'SALTAR',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF09E2A2B))),
                    onPressed: (){},
                  )
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(left: 20,right:20),
                  child: TextButton(
                    child: const Text(
                      'SIGUIENTE',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF09E2A2B))),
                    onPressed: (){},
                  )
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}