import 'package:flutter/material.dart';
import 'package:proyect/widgets/customCard.dart';
import 'package:proyect/widgets/customCardList.dart';
import 'package:proyect/widgets/topBar.dart';

class WallyRaquet extends StatelessWidget {
  const WallyRaquet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TopBar(),
      body: CustomCardList(
        title: "Wally - Raquet",
        cardList: [
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Cancha #1',
            textColor: Colors.white,
            onTap: () {
              // Navigator.pushNamed(context, "/futbol8");
            },
          ),
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Cancha #2',
            textColor: Colors.white,
            onTap: () {
              // Navigator.pushNamed(context, "/wally-raquet");
            },
          ),
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
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