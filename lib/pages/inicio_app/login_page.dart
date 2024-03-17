import 'package:flutter/material.dart';
import 'package:proyect/widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text('Reserva con simples pasos tu cancha',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                        'Lorem ipsum dolor sit amet, adipiscing elit Manec pulvinar libero pellentesque erat, id gravida  porttitor dui. Vivamus cursus sit amet risus...',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.orange[600],
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 25),
                const LoginButton(
                    fondo: Colors.white,
                    texto: Color(0x00001358),
                    label: 'Iniciar Sesion',
                    funcion: null),
              ])),
        ),
      ),
    );
  }
}
