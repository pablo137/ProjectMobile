import 'package:flutter/material.dart';
import 'package:proyect/pages/fields_page.dart';

import 'package:proyect/pages/inicio_app/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true,
            //colorScheme: Color.fromARGB(255, 00, 49, 53)
            colorSchemeSeed: const Color(0xCA004953)
            //colorSchemeSeed: Colors.blue
            ),
        // home: LoginPage());
        home: const Fields());
  }
}
