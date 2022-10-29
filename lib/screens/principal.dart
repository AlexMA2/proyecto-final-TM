import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_tm/screens/Principal/Footer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Principal extends StatefulWidget {
  const Principal({super.key, this.title = "PawClues"});
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
      count: imagenes.length,
      effect: const SlideEffect(
        dotWidth: 15,
        dotHeight: 15,
        dotColor: Color.fromARGB(255, 109, 16, 20),
        activeDotColor: Color.fromARGB(255, 234, 231, 231)
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 176, 1),
      body: ListView(
        children: [
          Column(
            children: [
              const Padding(
                padding:EdgeInsets.all(16.0),
                child: Text(
                  'PawClues te ayuda a encontrar a tu mascota perdida mediante inteligencia artificial.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'Estas mascotas volvieron a su hogar con nuestra ayuda',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 270,
                  autoPlay: true,
                  reverse: true,
                  onPageChanged: (index, reason) => setState(()=> activeIndex = index)
                ),
                itemCount: imagenes.length,
                itemBuilder: (context, index, realIndex){
                  final urlImagen = imagenes[index];
                  return buildImage(urlImagen, index);
                },
                
              ),
              Padding(
                padding:const EdgeInsets.all(10.0),
                child: buildIndicator(),
              ),
              const Padding(
                padding: EdgeInsets.only(top:15, bottom: 15),
                child: Text(
                  '¿Cómo utilizar PawClues?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 234, 231, 231),
                    ),
                    child: Column(
                      children: [
                        const Image(
                          width: 100,
                          height: 100,
                          image: NetworkImage('https://cdn.icon-icons.com/icons2/1303/PNG/512/checkform_85890.png'
                        )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          margin: EdgeInsets.only(top:10, bottom: 10),
                          child: const Text(
                            'Llena el formulario con los datos y fotos de tu mascota',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 234, 231, 231),
                    ),
                    child: Column(
                      children: [
                        const Image(
                          width: 100,
                          height: 100,
                          image: AssetImage("assets/images/lupapatita.png")),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.only(top:10, bottom: 10),
                          child: const Text('Haz match para encontrar a tu mascota entre coincidencias',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top:15, bottom: 15),
                child: Text(
                  'PawClues',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 137, 57, 60),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Image(
                        height: 100,
                        image: AssetImage('assets/images/pawclueslogo.png')
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 0.0),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                      'Nuestra misión es ayudarte en la búsqueda de tu mascota perdida, lo hacemos mediante IA (Inteligencia Artificial) para hacer la búsqueda más eficaz, confiable y exacta.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Footer()
            ],
        )],
      )

    );
  }

}