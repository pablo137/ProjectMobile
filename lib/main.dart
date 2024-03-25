import 'package:flutter/material.dart';
import 'package:proyect/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _routes = routes;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xCA004953)),
      initialRoute: '/',
      routes: _routes,
    );
  }
}
