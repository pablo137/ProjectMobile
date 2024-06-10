import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:proyect/domain/models/my_reservations.dart';
import 'package:proyect/repository/my_reservations/my_reservations_repository.dart';
import 'package:proyect/widgets/nav_bars/sideBar.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class ReservationPage extends StatefulWidget {
  final String cancha;

  const ReservationPage({
    Key? key,
    required this.cancha,
  }) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late Reserva reserva;
  User? user;
  bool _isReserving = false;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _initializeReserva();
  }

  Future<void> _initializeReserva() async {
    setState(() {
      reserva = Reserva(
        cancha: widget.cancha,
        estado: 'Pendiente',
        fecha: DateTime.now(),
        hora: '',
        usuarioId: user?.uid ?? '',
        usuario: user?.displayName ?? '',
      );
    });
  }

  void _onReservePressed() {
    setState(() {
      _isReserving = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isReserving = false;
      });
      addReservation(reserva);
    });
  }

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
              'Reservación de ${widget.cancha}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xCA004953),
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
                color: Color(0xCA004953),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 85,
                  color: const Color(0xFFFFFFFF),
                  child: CalendarCarousel(
                    todayBorderColor: Colors.green,
                    todayButtonColor: Colors.green,
                    weekendTextStyle: const TextStyle(color: Colors.black),
                    weekdayTextStyle: const TextStyle(color: Colors.black),
                    headerTextStyle: const TextStyle(color: Colors.black),
                    selectedDayTextStyle: const TextStyle(color: Colors.white),
                    selectedDayButtonColor: Colors.green,
                    selectedDateTime: DateTime.now(),
                    onDayPressed: (DateTime selectedDay, List<dynamic> events) {
                      setState(() {
                        reserva = Reserva(
                          cancha: reserva.cancha,
                          estado: reserva.estado,
                          fecha: selectedDay,
                          hora: reserva.hora,
                          usuarioId: reserva.usuarioId,
                          usuario: reserva.usuario,
                        );
                      });
                    },
                    showHeader: false,
                    isScrollable: true,
                    height: 50,
                    daysHaveCircularBorder: null,
                    pageScrollPhysics: const BouncingScrollPhysics(),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  reserva = Reserva(
                                    cancha: reserva.cancha,
                                    estado: reserva.estado,
                                    fecha: reserva.fecha,
                                    hora: '${index + 7 + 1}:00 AM',
                                    usuarioId: reserva.usuarioId,
                                    usuario: reserva.usuario,
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: Text('Hora ${index + 7 + 1}:00 AM'),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  reserva = Reserva(
                                    cancha: reserva.cancha,
                                    estado: reserva.estado,
                                    fecha: reserva.fecha,
                                    hora: '${index + 10 + 5}:00 PM',
                                    usuarioId: reserva.usuarioId,
                                    usuario: reserva.usuario,
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: Text('Hora: ${index + 10 + 5}:00 PM'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isReserving ? 60 : 150,
                  height: _isReserving ? 60 : 50,
                  child: ElevatedButton(
                    onPressed: _isReserving ? null : _onReservePressed,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: const Color(0xCA004953),
                    ),
                    child: _isReserving
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Reservar',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
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
        autoPlayInterval: const Duration(seconds: 3),
        enableInfiniteScroll: true,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
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
