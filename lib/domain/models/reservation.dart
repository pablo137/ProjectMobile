// import 'package:cloud_firestore/cloud_firestore.dart';

// class Reserva {
//   final String cancha;
//   final String estado;
//   final DateTime fecha;
//   final String canchaId;
//   final String deporte;
//   final String usuarioId;
//   final String usuario

//   Reserva({required this.cancha, required this.fecha, required this.estado)//,required this.canchaId,required this.deporte, required this.usuarioId, required this.usuario});

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
