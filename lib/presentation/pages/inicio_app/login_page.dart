import 'package:flutter/material.dart';
import 'package:proyect/widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF004952),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Padding(
                  padding: EdgeInsets.only(top: 95.0, bottom: 10.0),
                  child: Center(
                    child:
                        Image(image: AssetImage('assets/images/ReservaYa.png')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 90.0),
                  child: Center(
                    child: Text('Reserva al instante, juega en grande',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
                  child: Center(
                    child: Text('Inicia sesión o regístrate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                LoginButton(
                  fondo: Colors.white,
                  texto: Color(0xFF004952),
                  label: '   Iniciar Sesion con Google   ',
                ),
                const SizedBox(height: 20),
                LoginButton(
                  fondo: Colors.white,
                  texto: Color(0xFF004952),
                  label: ' Iniciar Sesion con Facebook ',
                ),
              ])),
        ),
      ),
    );
  }
}
