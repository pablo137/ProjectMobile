import 'package:flutter/material.dart';
import 'package:proyect/My%20reservations/reservation_list.dart';

class ReservationCard extends StatelessWidget {
  final Reserva reserva;

  const ReservationCard(this.reserva);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
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
              style: 
                  TextStyle(fontWeight: FontWeight.bold, 
                  color: Color(0xCA004953),fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Cancha: ${reserva.nombre}',
                style: TextStyle(color: Color(0xCA004953),)),
            Text(
                'Fecha: ${DateTime.now().toString()}',
                style: TextStyle(color: Color(0xCA004953)),
                ), // Colocar la fecha real
            Text('Horario: 10:00 - 12:00',
              style: TextStyle(color: Color(0xCA004953)),
              ), // Colocar el horario real
            // if (reserva.estado == 'Pendiente')
            //   FlatButton(
            //     onPressed: () {
            //       // Agregar lógica para cancelar la reserva
            //     },
            //     child: Text('Cancelar'),
            //   ),
          ],
        ),
      ),
    );
  }
}
