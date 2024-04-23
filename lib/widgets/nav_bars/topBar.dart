import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colors.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Align(
        alignment: Alignment.centerRight,
        child: Image.asset(
          'assets/images/ReservaYaHorizontal.png',
          height: 90,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
