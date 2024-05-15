import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyect/presentation/pages/login/login_page.dart';
import '../../presentation/pages/carrusel_intro_screen/carrusel_intro_screen_page.dart';
import 'package:proyect/services/auth_google.dart';

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
        onPressed: () async {
          final AuthUser authUser = AuthUser();
          try {
            final user = await authUser.loginGoogle();
            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          } on FirebaseAuthException catch (error) {
            print(error.message);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(error.message ?? 'Chales... algo salio mal')));
          } catch (error) {
            print(error);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error.toString())));
          }

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
