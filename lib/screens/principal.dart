import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/main.dart';
import 'package:proyecto_final_tm/screens/DrawerNav.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'MatchPets.dart';
import 'ReportAnimal.dart';
import 'SearchPet.dart';

class Principal extends StatefulWidget {
  const Principal({super.key, required this.title});
  final String title;
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  List<String> imagenes = [
    "https://www.fundacion-affinity.org/sites/default/files/los-10-sonidos-principales-del-perro.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2022/08/estudio-ayuda-a-conocer-origen-de-los-perros.jpg",
    "https://www.petdarling.com/wp-content/uploads/2020/11/razas-de-perros.jpg",
    "https://www.elmueble.com/medio/2022/09/05/perro-cachorro_82dd9cd3_900x900.jpg",
    "https://www.purina-latam.com/sites/g/files/auxxlc391/files/styles/social_share_large/public/conoce-las-razas-de-perros-que-no-crecen-mucho.jpg?itok=YLqKYO2-"
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {


    Widget buildImage(String urlImagen, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        urlImagen,
        fit: BoxFit.cover
      ),
    );

    Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imagenes.length
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 176, 1),
      body: Container(
        height: 700,
        width: 600,
        child: Column(
          children: [
            const Padding(
              padding:EdgeInsets.all(16.0),
              child: Text(
                'Te ayudamos a buscar a tu mascota perdida.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  
                ),
              ),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                reverse: true,
                // enableInfiniteScroll: false,
                onPageChanged: (index, reason) => setState(()=> activeIndex = index)
              ),
              itemCount: imagenes.length,
              itemBuilder: (context, index, realIndex){
                final urlImagen = imagenes[index];
                return buildImage(urlImagen, index);
              },
              
            ),
            Padding(
              padding:EdgeInsets.all(10.0),
              child: buildIndicator(),
            )
          ],
        ),
      )

    );
  }

}