import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyect/pages/Reservations/reservation_card.dart';
import 'package:proyect/pages/Reservations/reservation_list.dart';


class RerservationPage extends StatefulWidget {
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
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(top: 20), // Ajusta la distancia hacia abajo
          alignment: Alignment.center, // Centra el texto horizontalmente
          child: Text(
            'Mis Reservas',
            style: TextStyle(
              color: Color(0xCA004953),
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          SizedBox(height: 20),
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
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FilterButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: Color(0xCA004953),
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Color(0xCA004953)),
        ),
      ),
    );
  }
}
