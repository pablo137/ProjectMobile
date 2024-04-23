import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/presentation/pages/Reservations/reservation_page.dart';
import 'package:proyect/presentation/bloc/pages/courts/courts_page.dart';
import 'package:proyect/presentation/bloc/pages/courts/futbol8_page.dart';
import 'package:proyect/presentation/bloc/pages/courts/wallyRaquet_page.dart';
import 'package:proyect/presentation/bloc/pages/login/login_page.dart';
import 'package:proyect/presentation/pages/error_page.dart';

// Definición de rutas
Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(), //LoginPage()
  // '/profile':(context) => const Profile(), //Profile()
  '/wally-raquet': (context) => const WallyRaquet(),
  '/futbol8': (context) => const Futbol8(),
  '/canchas': (context) => const Courts(),
  '/mis_reservas': (context) => const RerservationPage(),
  '/Cerrar_sesion': (context) => const LoginPage(),

  // '/':(context) => HomePage(),
  // '/mis_reservas':(context) => const MisReservas(),
};


class NyAppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
        GoRoute(
          path: '/wally-raquet',
          pageBuilder: (context, state) {
            return const MaterialPage(child: WallyRaquet());
          },
        ),
        GoRoute(
          path: '/futbol8',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Futbol8());
          },
        ),
        GoRoute(
          path: '/canchas',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Courts());
          },
        ),
        GoRoute(
          path: '/mis_reservas',
          pageBuilder: (context, state) {
            return const MaterialPage(child: RerservationPage());
          },
        ),
        GoRoute(
          path: '/Cerrar_sesion',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },
    );
    return router;
  }
}
