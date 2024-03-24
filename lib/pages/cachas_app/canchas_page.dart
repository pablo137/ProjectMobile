import 'package:flutter/material.dart';
import 'package:proyect/pages/cachas_app/card_canchas.dart';
import 'package:proyect/widgets/bottomNav.dart';
import 'package:proyect/widgets/sideBar.dart';

class Canchas extends StatefulWidget {
  const Canchas({Key? key}) : super(key: key);

  @override
  State<Canchas> createState() => _CanchasState();
}

class _CanchasState extends State<Canchas> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
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
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 25.0),
                  Text(
                    'CANCHAS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    imagePath: 'assets/images/futbol8.png',
                    text: 'Futbol 8',
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomCard(
                    imagePath: 'assets/images/volleyball.png',
                    text: 'Wally - Raquet',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
