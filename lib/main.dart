import 'package:flutter/material.dart';
import 'package:proyect/presentation/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://3dc3982f3b5b77a295639b94c2d63d90@o4507145948692480.ingest.us.sentry.io/4507145965076480';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );
  // runApp(MyApp());
  try {
    int? test;
    test! + 3;
  } catch (exception, stackTrace) {
    debugPrint("CATCH ERROR");
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }
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
