import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:proyect/widgets/nav_bars/sideBar.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: const TopBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Reservación de Wally',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xCA004953), // Color de texto
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: CarouselPage(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Horarios Disponibles',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xCA004953), // Color de texto
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 70, // Altura del calendario
                  color: Color(0xFFFFFFFF), // Color de fondo del contenedor
                  child: CalendarCarousel(
                    // Configuraciones del calendario
                    todayBorderColor: Colors.green,
                    todayButtonColor: Colors.green,
                    weekendTextStyle: TextStyle(color: Colors.black),
                    weekdayTextStyle: TextStyle(color: Colors.black),
                    headerTextStyle: TextStyle(color: Colors.black),
                    selectedDayTextStyle: TextStyle(color: Colors.white),
                    selectedDayButtonColor: Colors.green,
                    selectedDateTime: DateTime.now(),
                    onDayPressed: (DateTime selectedDay, List<dynamic> events) {
                      // Lógica para manejar la selección del día
                    },
                    showHeader: false, // Oculta el encabezado del calendario
                    isScrollable: true, // Habilita el desplazamiento horizontal del calendario
                    // weekFormat: false, // Muestra solo una semana
                    height: 50, // Altura del calendario
                    daysHaveCircularBorder: null, // Borde circular en los días
                  ),
                ),
                SizedBox(height: 20), // Espacio entre el calendario y los botones
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10), // Espacio vertical entre las filas de botones
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 100, // Ancho del botón
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // Lógica para manejar el botón presionado
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12), // Ajuste del tamaño del botón
                              ),
                              child: Text('Hora ${index + 1}'),
                            ),
                            
                          ),
                  
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 100, // Ancho del botón
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // Lógica para manejar el botón presionado
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12), // Ajuste del tamaño del botón
                              ),
                              child: Text('Hora ${index + 5}'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Espacio entre los botones y el botón "Reservar"
                ElevatedButton(
                  onPressed: () {
                    // Lógica para manejar el botón "Reservar" presionado
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70), // Ajuste del tamaño del botón
                    backgroundColor: const Color(0xCA004953), // Color de fondo del botón
                  ),
                  child: Text(
                    'Reservar',
                    style: TextStyle(
                      fontSize: 20, // Tamaño de fuente del texto
                      color: Colors.white, // Color del texto
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/futbol8.png',
    'assets/images/futbol8.png',
    'assets/images/futbol8.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3), // Intervalo de reproducción automática
        enableInfiniteScroll: true,
      ),
      items: imageList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}