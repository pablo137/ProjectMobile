import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyect/domain/models/canchas_model.dart';

class CanchasRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Cancha>> fetchReservationCanchas() async {
    List<Cancha> canchas = [];
    CollectionReference collectionReferenceCancha = _db.collection('canchas');

    try {
      QuerySnapshot queryCanchas = await collectionReferenceCancha.get();
      canchas = queryCanchas.docs.map((doc) {
        return Cancha.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch reservations: $e');
    }

    return canchas;
  }

  Future<Cancha?> obtenerCanchaPorId(String canchaId) async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;

  try {
    DocumentSnapshot documentoCancha =
        await _db.collection('canchas').doc(canchaId).get();
    if (documentoCancha.exists) {
      return Cancha.fromMap(documentoCancha.data() as Map<String, dynamic>);
    }
  } catch (e) {
    throw Exception('Error al obtener la cancha: $e');
  }
  return null;
}

}

