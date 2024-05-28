import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex; // Agregar selectedIndex como parámetro de entrada

  const BottomNav({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: widget.selectedIndex,
      onTap: (value) {
        if (value == widget.selectedIndex) return; // Evita la recarga si se selecciona la misma página

        setState(() {
          // selectedIndex = value;
        });
        switch (value) {
          case 0:
            GoRouter.of(context).push(Uri(path: '/canchas').toString());
            break;
          case 1:
            GoRouter.of(context).push(Uri(path: '/mis_reservas').toString());
            break;
        }
      },
      elevation: 0,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey[350],
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.group_work_outlined),
          activeIcon: const Icon(Icons.group_work),
          label: 'Canchas',
          backgroundColor: colors.primary,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_month_outlined),
          activeIcon: const Icon(Icons.calendar_month),
          label: 'Mis Reservas',
          backgroundColor: colors.primary,
        )
      ],
    );
  }
}
