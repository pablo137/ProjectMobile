import 'package:flutter/material.dart';
import '../../presentation/pages/carrusel_intro_screen/carrusel_intro_screen_page.dart';

class LoginButton extends StatelessWidget {
  final Color fondo;
  final Color texto;
  final String label;
  final double? pading;

  const LoginButton(
      {super.key,
      required this.fondo,
      required this.texto,
      required this.label,
      this.pading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: pading ?? 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IntroScreenDefault()),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(fondo),
        ),
        child: Text(
          label,
          style: TextStyle(color: texto, fontSize: 20),
        ),
      ),
    );
  }
}
