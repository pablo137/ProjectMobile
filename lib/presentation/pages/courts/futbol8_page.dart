import 'package:flutter/material.dart';
import 'package:proyect/widgets/cards/customCard.dart';
import 'package:proyect/widgets/cards/customCardList.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';
class Futbol8 extends StatelessWidget {
  const Futbol8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TopBar(),
      body: CustomCardList(
        title: "Futbol 8",
        cardList: [
          CustomCard(
            imagePath: 'assets/images/futbol8.png',
            text: 'Cancha #1',
            textColor: Colors.white,
            onTap: () {
              // Navigator.pushNamed(context, "/futbol8");
            },
          ),
          CustomCard(
            imagePath: 'assets/images/futbol8.png',
            text: 'Cancha #2',
            textColor: Colors.white,
            onTap: () {
              // Navigator.pushNamed(context, "/wally-raquet");
            },
          ),
          CustomCard(
            imagePath: 'assets/images/futbol8.png',
            text: 'Cancha #3',
            textColor: Colors.white,
            onTap: () {
              // Navigator.pushNamed(context, "/wally-raquet");
            },
          ),
          // Aquí puedes añadir más CustomCard 
        ],
      ),
    );
  }
}