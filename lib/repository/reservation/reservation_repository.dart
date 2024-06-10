
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyect/domain/models/my_reservations.dart';

class ReservationRepository {
  Future<List<Reserva>> fetchReservation() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<Reserva> misReservas = [];
    // Referencia a la colección
    CollectionReference collectionReferenceReserva = db.collection('reservas');

    try {
      // Obtener documentos de la colección
      QuerySnapshot queryMisReservation = await collectionReferenceReserva.get();

      // Mapear los documentos a instancias de Reserva
      misReservas = queryMisReservation.docs.map((doc) {
        return Reserva.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch reservations: $e');
    }

    return misReservas;
  }
}
