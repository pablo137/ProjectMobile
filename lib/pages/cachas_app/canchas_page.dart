import 'package:flutter/material.dart';
import 'package:proyect/widgets/customCard.dart';
import 'package:proyect/widgets/bottomNav.dart';
import 'package:proyect/widgets/customCardList.dart';
import 'package:proyect/widgets/sideBar.dart';
import 'package:proyect/widgets/topBar.dart';

class Canchas extends StatefulWidget {
  const Canchas({Key? key}) : super(key: key);

  @override
  State<Canchas> createState() => _CanchasState();
}

class _CanchasState extends State<Canchas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: const TopBar(),
      body: CustomCardList(
        title: "Canchas",
        cardList: [
          CustomCard(
            imagePath: 'assets/images/futbol8.png',
            text: 'Futbol 8',
            textColor: Colors.white,
            onTap: () {
              Navigator.pushNamed(context, "/futbol8");
            },
          ),
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Wally - Raquet',
            textColor: Colors.white,
            onTap: () {
              Navigator.pushNamed(context, "/wally-raquet");
            },
          ),
          // Aquí puedes añadir más CustomCard 
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
