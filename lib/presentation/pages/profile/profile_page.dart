import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static const double tDefaultSize = 20.0;

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 73, 83, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/ReservaYaHorizontal.png',
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    user?.photoURL ?? '',
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                user?.displayName ?? "",
                style: const TextStyle(
                  color: Color.fromRGBO(0, 73, 83, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                user?.email ?? "",
                style: const TextStyle(
                  color: Color.fromRGBO(0, 73, 83, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 200),
              InkWell(
                onTap: () {},
                child: const Text(
                  '¿Necesitas ayuda?',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 73, 83, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  // Navigator.pushReplacementNamed(context, '/Cerrar_sesion');
                  // ignore: use_build_context_synchronously
                  GoRouter.of(context)
                      .push(Uri(path: '/Cerrar_sesion').toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 148, 167, 1),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
