import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa la biblioteca intl
import 'package:proyect/domain/models/my_reservations_page.dart';

class ReservationCard extends StatelessWidget {
  final Reserva reserva;

  const ReservationCard(this.reserva, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Formatear la fecha
    String formattedDate = DateFormat('yyyy-MM-dd').format(reserva.fecha);
    // Formatear la hora en formato de 12 horas (AM/PM)
    String formattedTime = DateFormat('hh:mm a').format(reserva.fecha);

    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Color(0xCA004953),
        ),
      ),
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
                fontSize: 18,
              ),
            ),
            Text(
              'Cancha: ${reserva.cancha}',
              style: const TextStyle(
                color: Color(0xCA004953),
              ),
            ),
            Text(
              'Fecha: $formattedDate',
              style: const TextStyle(color: Color(0xCA004953)),
            ),
            Text(
              'Horario: $formattedTime',
              style: const TextStyle(color: Color(0xCA004953)),
            ),
          ],
        ),
      ),
    );
  }
}
