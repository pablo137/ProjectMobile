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
            return const MaterialPage(child: MyReservationPage());
          },
        ),
        GoRoute(
          path: '/Cerrar_sesion',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
        GoRoute(
          path: '/reservas/:cancha',
          builder: (context, state) {
            final cancha = state.pathParameters['cancha']!;
            return ReservationPage(cancha: cancha);
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
