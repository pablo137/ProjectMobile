import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color fondo;
  final Color texto;
  final String label;
  final double? pading;
  final void Function()? funcion;
  const LoginButton(
      {super.key,
      required this.fondo,
      required this.texto,
      required this.funcion,
      required this.label,
      this.pading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: pading ?? 0),
      child: ElevatedButton(
        onPressed: funcion,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(fondo),
        ),
        child: Text(
          label,
          style: TextStyle(color: texto, fontSize: 16),
        ),
      ),
    );
  }
}
