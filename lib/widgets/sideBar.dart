import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyect/Profile/profile_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: colors.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.primary,
            ),
            child: Image.asset(
              'assets/images/ReservaYa.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_sharp, color: Colors.white),
            title: Text(
              'Usuario',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {
              // Navigator.pushNamed(context, "/profile")
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support, color: Colors.white),
            title: Text(
              'Contacto',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {},
          )
        ],
      ),
    );
  }
}
