import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/presentation/controllers/user_controller.dart';
import '../../presentation/pages/carrusel_intro_screen/carrusel_intro_screen_page.dart';

class LoginButton extends StatefulWidget {
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
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: widget.pading ?? 0),
      child: ElevatedButton(
        onPressed: () async {
          try {
            final user = await UserController.loginWithGoogle();
            if (user != null && mounted) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const IntroScreenDefault()),
              // );
              GoRouter.of(context).push('/intro_default');
            }
          } on FirebaseAuthException catch (error) {
            print(error.message);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              error.message ?? "Something wrong",
            )));
          } catch (error) {
            print(error);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error.toString())));
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(widget.fondo),
        ),
        child: Text(
          widget.label,
          style: TextStyle(color: widget.texto, fontSize: 20),
        ),
      ),
    );
  }
}
