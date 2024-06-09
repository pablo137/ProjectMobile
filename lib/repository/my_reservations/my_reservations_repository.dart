
// import 'package:proyect/domain/my_reservations/my_reservations_page.dart';

// class MyReservationRepository {
//   Future<List<Reserva>> fetchReservation() async {
//     final apiUrl = "https://api.github.com/users/$username"; //aqui es para la api
//     List<Reserva> list = [];
//     // o el resultado es un Objeto o el resultado es una List

//     try {
// List<Reserva> reservas = [
//   Reserva('Reserva 1', 'Confirmada'),
//   Reserva('Reserva 2', 'Pendiente'),
//   Reserva('Reserva 3', 'Confirmada'),
//   Reserva('Reserva 4', 'Pendiente'),
// ];
// return reservas;
//      // final response = await Dio().get(apiUrl);
      
//       // if( response.statusCode == 200) {
//       //   final userData = response.data;
//       //   return Reserva.fromMap(userData);


//       // } else {
//       //   throw Exception('Failed to load user data');
//       // }
//     } catch (e) {
//       throw Exception('Failed to fetch user data: $e');
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyect/domain/models/my_reservations.dart';

class MyReservationRepository {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Reserva>> fetchReservation() async {
   
    List<Reserva> misReservas = [];
    // Referencia a la colección

    //final FirebaseFirestore _db = FirebaseFirestore.instance;
    CollectionReference collectionReferenceReserva = _db.collection('reservas');

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


Future<void> addReservation(Reserva reserva) async {
  final docRef = FirebaseFirestore.instance.collection('reservas').doc(); // Obtener una referencia al documento
  final docId = docRef.id; // Obtener el ID del documento

  // Crear un nuevo mapa con el ID del documento
  final data = reserva.toMap()..addAll({'docId': docId});

  await docRef.set(data); // Guardar los datos en el documento
}
