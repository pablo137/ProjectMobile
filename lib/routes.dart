import 'package:flutter/material.dart';
import 'package:proyect/pages/Reservations/reservation_page.dart';
import 'package:proyect/pages/cachas_app/canchas_page.dart';
import 'package:proyect/pages/cachas_app/futbol8_page.dart';
import 'package:proyect/pages/cachas_app/wallyRaquet_page.dart';
import 'package:proyect/pages/inicio_app/login_page.dart';

// Definición de rutas
Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(), //LoginPage()
  // '/profile':(context) => const Profile(), //Profile()
  '/wally-raquet': (context) => const WallyRaquet(),
  '/futbol8': (context) => const Futbol8(),
  '/canchas': (context) => const Canchas(),
  '/mis_reservas':(context) =>  const RerservationPage(),
  '/Cerrar_sesion':(context) => const LoginPage(),

  // '/':(context) => HomePage(),
  // '/mis_reservas':(context) => const MisReservas(),
};
