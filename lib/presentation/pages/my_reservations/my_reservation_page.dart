import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyect/domain/models/my_reservations.dart';
import 'package:proyect/domain/my_reservations/my_reservations_page.dart';
import 'package:proyect/repository/my_reservations/my_reservations_repository.dart';
import 'package:proyect/widgets/nav_bars/bottomNav.dart';
import 'package:proyect/widgets/nav_bars/sideBar.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class MyReservationPage extends StatefulWidget {
  const MyReservationPage({super.key});

  @override
  _MyReservationPageState createState() => _MyReservationPageState();
}

class _MyReservationPageState extends State<MyReservationPage> {
  String filtro = 'Todas';
  late Future<List<Reserva>> _futureReservas;
  final String userId = FirebaseAuth.instance.currentUser!.uid; // Obtener el UID del usuario actual

  @override
  void initState() {
    super.initState();
    _futureReservas = MyReservationRepository().fetchReservation();
  }

  List<Reserva> filtrarReservas(List<Reserva> reservas) {
    if (filtro == 'Todas') {
      return reservas;
    } else {
      return reservas.where((reserva) => reserva.estado == filtro).toList();
    }
  }

  List<Reserva> filtrarPorUsuario(List<Reserva> reservas) {
    return reservas.where((reserva) => reserva.usuarioId == userId).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: const TopBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Mis reservas',
            style: TextStyle(
                color: Color(0xCA004953),
                fontWeight: FontWeight.bold,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterButton(
                text: 'Todas',
                onPressed: () {
                  setState(() {
                    filtro = 'Todas';
                  });
                },
              ),
              FilterButton(
                text: 'Confirmadas',
                onPressed: () {
                  setState(() {
                    filtro = 'Confirmada';
                  });
                },
              ),
              FilterButton(
                text: 'Pendientes',
                onPressed: () {
                  setState(() {
                    filtro = 'Pendiente';
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<List<Reserva>>(
              future: _futureReservas,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay reservas disponibles'));
                }

                List<Reserva> reservasFiltradas = filtrarReservas(snapshot.data!);
                List<Reserva> reservasUsuarioActual = filtrarPorUsuario(reservasFiltradas);

                return ListView.builder(
                  itemCount: reservasUsuarioActual.length,
                  itemBuilder: (context, index) {
                    return ReservationCard(reservasUsuarioActual[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 1),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FilterButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: const Color(0xCA004953),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xCA004953)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
