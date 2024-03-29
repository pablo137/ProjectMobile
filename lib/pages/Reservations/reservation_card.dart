import 'package:flutter/material.dart';
import 'package:proyect/pages/Reservations/reservation_list.dart';

class ReservationCard extends StatelessWidget {
  final Reserva reserva;

  const ReservationCard(this.reserva, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: Color(0xCA004953),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              reserva.estado == 'Pendiente'
                  ? 'Reserva Pendiente'
                  : reserva.estado == 'Confirmada'
                      ? 'Reserva Confirmada'
                      : '',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xCA004953),
                  fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text('Cancha: ${reserva.nombre}',
                style: const TextStyle(
                  color: Color(0xCA004953),
                )),
            Text(
              'Fecha: ${DateTime.now().toString()}',
              style: const TextStyle(color: Color(0xCA004953)),
            ), // Colocar la fecha real
            const Text(
              'Horario: 10:00 - 12:00',
              style: TextStyle(color: Color(0xCA004953)),
            ),
            // if (reserva.estado == 'Pendiente')
            //   ElevatedButton(onPressed: (){}, 
            //     child: const Text(
            //       'Cancelar', 
            //       style: TextStyle(
            //       color: Colors.white, fontSize: 10,
            //   ),))
          ],
        ),
      ),
    );
  }
}
