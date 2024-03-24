import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        showUnselectedLabels: true,
        // selectedItemColor: colors.secondary,
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
      ),
    );
  }
}