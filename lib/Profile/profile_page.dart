import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static const double tDefaultSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 73, 83, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Text(
                'Mi perfil',
                style: TextStyle(
                  color: Color.fromRGBO(0, 73, 83, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/tProfileImage.png'),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Usuario',
                style: TextStyle(
                  color: Color.fromRGBO(0, 73, 83, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Correo Electronico',
                style: TextStyle(
                  color: Color.fromRGBO(0, 73, 83, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 200),
              InkWell(
                onTap: () {},
                child: Text(
                  '¿Necesitas ayuda?',
                  style: TextStyle(
                    color:  Color.fromRGBO(0, 73, 83, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(2, 148, 167, 1),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                child: Text('Cerrar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
