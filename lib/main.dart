import 'package:flutter/material.dart';
import 'package:proyect/presentation/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://e95c3f1f295797003b1371ab9672c625@o4507145623502848.ingest.us.sentry.io/4507145626976256';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final _routes = routes;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final route = NyAppRouter.returnRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: route,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xCA004953)),
      // initialRoute: '/',
      // routes: _routes,
    );
  }
}

