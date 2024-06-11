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
  Reserva copyWith({
    String? cancha,
    String? estado,
    DateTime? fecha,
    String? hora,
    String? usuarioId,
    String? usuario,
  }) {
    return Reserva(
      cancha: cancha ?? this.cancha,
      estado: estado ?? this.estado,
      fecha: fecha ?? this.fecha,
      hora: hora ?? this.hora,
      usuarioId: usuarioId ?? this.usuarioId,
      usuario: usuario ?? this.usuario,
    );
}
}