import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/presentation/pages/reservations/reservation_page.dart';
import 'package:proyect/presentation/pages/courts/courts_page.dart';
import 'package:proyect/presentation/pages/courts/futbol8_page.dart';
import 'package:proyect/presentation/pages/courts/wallyRaquet_page.dart';
import 'package:proyect/presentation/pages/login/login_page.dart';
import 'package:proyect/presentation/pages/errors/error_page.dart';


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
