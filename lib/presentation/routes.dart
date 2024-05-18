import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/presentation/controllers/user_controller.dart';
import 'package:proyect/presentation/pages/my_reservations/my_reservation_page.dart';
import 'package:proyect/presentation/pages/courts/courts_page.dart';
import 'package:proyect/presentation/pages/courts/futbol8_page.dart';
import 'package:proyect/presentation/pages/courts/wallyRaquet_page.dart';
import 'package:proyect/presentation/pages/login/login_page.dart';
import 'package:proyect/presentation/pages/errors/error_page.dart';
import 'package:proyect/presentation/pages/reservation/reservation_page.dart';

// Definición de rutas
Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(), //LoginPage()
  // '/profile':(context) => const Profile(), //Profile()
  '/wally-raquet': (context) => const WallyRaquet(),
  '/futbol8': (context) => const Futbol8(),
  '/canchas': (context) => const Courts(),
  '/mis_reservas': (context) => const MyRerservationPage(),
  '/Cerrar_sesion': (context) => const LoginPage(),
  '/reservas': (context) => const ReservationPage(),

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
            return UserController.user == null ? const MaterialPage(child: LoginPage()) : const MaterialPage(child: Courts());
          },
        ),
        GoRoute(
          path: '/mis_reservas',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MyRerservationPage());
          },
        ),
        GoRoute(
          path: '/Cerrar_sesion',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
         GoRoute(
          path: '/reservas',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ReservationPage());
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
