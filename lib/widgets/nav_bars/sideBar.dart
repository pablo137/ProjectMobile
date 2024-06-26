import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/presentation/controllers/user_controller.dart';
import 'package:proyect/presentation/pages/sketch/sketch_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proyect/presentation/pages/profile/profile_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.map, color: Colors.white),
            title: const Text(
              'Croquis',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              GoRouter.of(context).push('/croquis');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.white),
            title: const Text(
              'Políticas de Privacidad',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              _launchURL('https://sites.google.com/view/reservaya/inicio');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text(
              'Cerrar Sesión',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              await UserController.signOut();
              if (mounted) {
                GoRouter.of(context).push(Uri(path: '/').toString());
              }
            },
          ),
        ],
      ),
    );
  }

  // Método para abrir la URL en el navegador predeterminado del dispositivo
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
