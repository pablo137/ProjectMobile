import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect/data/reservation_bloc.dart';
import 'package:proyect/data/reservation_event.dart';
import 'package:proyect/data/reservation_state.dart';
import 'package:proyect/domain/models/my_reservations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:proyect/repository/my_reservations/my_reservations_repository.dart';
import 'package:proyect/widgets/nav_bars/sideBar.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class ReservationPage extends StatelessWidget {
  final String cancha;

  const ReservationPage({Key? key, required this.cancha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const SideBar(),
      appBar: const TopBar(),
      body: BlocProvider(
        create: (context) => ReservationBloc(
          reservationRepository: MyReservationRepository(),
        ),
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state is ReservationInitial) {
              context
                  .read<ReservationBloc>()
                  .add(InitializeReservation(cancha));
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReservationPending) {
              return buildReservationPending(context, state.reserva);
            } else if (state is ReservationConfirmed) {
              return buildReservationConfirmed(context, state.reserva);
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  Widget buildReservationPending(BuildContext context, Reserva reserva) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Reservación de ${reserva.cancha}',
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
                  selectedDateTime: reserva.fecha,
                  onDayPressed: (DateTime selectedDay, List<dynamic> events) {
                    if (!context
                        .read<ReservationBloc>()
                        .confirmedReservations
                        .any((reserva) => reserva.fecha == selectedDay)) {
                      context
                          .read<ReservationBloc>()
                          .add(UpdateReservationDate(selectedDay));
                    }
                  },
                  showHeader: false,
                  isScrollable: true,
                  weekFormat: true,
                  height: 70,
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
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:
                                  10.0), // Ajusta el valor según el espaciado deseado
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<ReservationBloc>().add(
                                      UpdateReservationTime(
                                          '${index + 7 + 1}:00 AM'),
                                    );
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: Text('Hora ${index + 7 + 1}:00 AM'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical:
                                  10.0), // Ajusta este valor para más o menos espacio
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<ReservationBloc>().add(
                                      UpdateReservationTime(
                                          '${index + 10 + 5}:00 PM'),
                                    );
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: Text('Hora: ${index + 10 + 5}:00 PM'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ReservationBloc, ReservationState>(
                builder: (context, state) {
                  if (state is ReservationPending) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<ReservationBloc>()
                              .add(ConfirmReservation());
                          //ButtonStyle color = ButtonStyle(animationDuration: const Duration(milliseconds:2));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: const Color(0xCA004953),
                        ),
                        child: const Text(
                          'Reservar',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (state is ReservationConfirmed) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: Colors
                              .grey, // Change color to grey for disabled state
                        ),
                        child: const Text(
                          'Reserva Confirmada',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildReservationConfirmed(BuildContext context, Reserva reserva) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
    return Center(
      child: AlertDialog(
        content: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text(
                'Enviando respuesta...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/futbol (1).png',
    'assets/images/futbol (2).png',
    'assets/images/futbol (3).png',
    'assets/images/futbol (4).png',
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
