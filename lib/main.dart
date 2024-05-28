import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proyect/presentation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
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
