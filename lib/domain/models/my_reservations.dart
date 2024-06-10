// class Reserva {
//   String nombre;
//   String estado;

//   Reserva(this.nombre, this.estado);
// }

// List<Reserva> reservas = [
//   Reserva('Reserva 1', 'Confirmada'),
//   Reserva('Reserva 2', 'Pendiente'),
//   Reserva('Reserva 3', 'Confirmada'),
//   Reserva('Reserva 4', 'Pendiente'),
// ];

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Reserva {
//   final String cancha;
//   final String estado;
//   final DateTime fecha;
//   final String canchaId;
//   final String deporte;
//   final String usuarioId;
//   final String usuario;

//   Reserva({required this.cancha, required this.fecha, required this.estado});

//   factory Reserva.fromMap(Map<String, dynamic> data) {
//     return Reserva(
//       cancha: data['Cancha'] ?? '',
//       estado: data['Estado'] ?? '',
//       fecha: (data['Fecha'] as Timestamp).toDate(),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'Cancha': cancha,
//       'Tipo': estado,
//       'Fecha': Timestamp.fromDate(fecha),
//     };
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Reserva {
  final String cancha;
  final String estado;
  final DateTime fecha;
  final String hora;
  final String usuarioId;
  final String usuario;

  Reserva({
    required this.cancha,
    required this.estado,
    required this.fecha,
    required this.hora, // change this to
    required this.usuarioId,
    required this.usuario,
  });

  factory Reserva.fromMap(Map<String, dynamic> data) {
    return Reserva(
      cancha: data['Cancha'] ?? '',
      estado: data['Estado'] ?? '',
      fecha: (data['Fecha'] as Timestamp).toDate(),
      hora: data['hora'] ?? '',
      usuarioId: data['UsuarioId'] ?? '',
      usuario: data['Usuario'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Cancha': cancha,
      'Estado': estado,
      'Fecha': Timestamp.fromDate(fecha),
      'hora': hora,
      'UsuarioId': usuarioId,
      'Usuario': usuario,
    };
  }
}
