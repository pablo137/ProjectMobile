import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/widgets/customCard.dart';
import 'package:proyect/widgets/bottoms/bottomNav.dart';
import 'package:proyect/widgets/customCardList.dart';
import 'package:proyect/widgets/sideBar.dart';
import 'package:proyect/widgets/topBar.dart';

class Courts extends StatefulWidget {
  const Courts({Key? key}) : super(key: key);

  @override
  State<Courts> createState() => _CourtsState();
}

class _CourtsState extends State<Courts> {
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
              // Navigator.pushNamed(context, "/futbol8");
              GoRouter.of(context).push(Uri(path: '/futbol8').toString());
            },
          ),
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Wally - Raquet',
            textColor: Colors.white,
            onTap: () {
              // Navigator.pushNamed(context, "/wally-raquet");
              GoRouter.of(context).push(Uri(path: '/wally-raquet').toString());
            },
          ),
          // Aquí puedes añadir más CustomCard
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
