import 'package:flutter/material.dart';

import '../MatchPets.dart';

class MatchPet extends StatefulWidget {

  final Quote datos;

  const MatchPet({super.key, required this.datos });
  // MatchPet({super.key, required this.imagen, required this.distrito, required this.descripcion});

  @override
  State<MatchPet> createState() => _MatchPetState();
}

class _MatchPetState extends State<MatchPet> {

  String _imagen = "datos";
  String _distrito = "";
  String _direccion = "";
  
  Quote? datos;



  @override
  Widget build(BuildContext context) {

  print(datos);


    return Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(30.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white
                  ),
                  child: Column(

                    children: [
                      const Image(
                        image: NetworkImage(
                          "https://estaticos.muyinteresante.es/uploads/images/gallery/6124cf315cafe8c3101f8bab/perro_redes.jpg",
                        ),
                      ),
                      const Text(
                        'Distrito donde fue hallado:',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        )
                      ),
                      const Text(
                        'Comas',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 25,right:25),
                            child: 
                              ElevatedButton.icon(
                                onPressed: (){}, 
                                icon : const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'No es',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                  )
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                                ),
                              ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 25,right:25),
                            child:
                              ElevatedButton.icon(
                                onPressed: (){}, 
                                icon : const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Si es',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                  )
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green
                                ),
                              ),
                          )
                      ],)
                    ],
                  ),
                )
              ],
            ),
          );
  }
}