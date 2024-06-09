class Cancha {
  Cancha({required this.id, required this.nombre, required this.deporte});

  String nombre;
  String id;
  String deporte; 

  factory Cancha.fromMap(Map<String, dynamic> data) {
    return Cancha(
      id: data['id'] ?? '',
      nombre: data['nombre'] ?? '',
      deporte: data['deporte'] ?? '',
    );
  }
}