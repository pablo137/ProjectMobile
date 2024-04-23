import 'package:flutter/material.dart';
import 'package:proyect/presentation/pages/reservations/reservation_card.dart';
import 'package:proyect/presentation/pages/reservations/reservation_list.dart';
import 'package:proyect/widgets/nav_bars/bottomNav.dart';
import 'package:proyect/widgets/nav_bars/sideBar.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class RerservationPage extends StatefulWidget {
  const RerservationPage({super.key});

  @override
  _RerservationPageState createState() => _RerservationPageState();
}

class _RerservationPageState extends State<RerservationPage> {
  String filtro = 'Todas';

  List<Reserva> get reservasFiltradas {
    if (filtro == 'Todas') {
      return reservas;
    } else {
      return reservas.where((reserva) => reserva.estado == filtro).toList();
    }
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
            child: ListView.builder(
              itemCount: reservasFiltradas.length,
              itemBuilder: (context, index) {
                return ReservationCard(reservasFiltradas[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 1,),
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
