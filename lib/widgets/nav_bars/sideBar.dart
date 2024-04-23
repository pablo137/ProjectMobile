import 'package:flutter/material.dart';
import 'package:proyect/presentation/pages/profile/profile_page.dart';

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
            leading: const Icon(Icons.person_sharp, color: Colors.white),
            title: const Text(
              'Usuario',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support, color: Colors.white),
            title: const Text(
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
