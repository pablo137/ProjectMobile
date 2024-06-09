import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/widgets/cards/customCard.dart';
import 'package:proyect/widgets/cards/customCardList.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class WallyRaquet extends StatelessWidget {
  const WallyRaquet({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: CustomCardList(
        title: "Wally - Raquet",
        cardList: [
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Cancha #1',
            textColor: Colors.white,
            onTap: () {
               GoRouter.of(context)
                  .push('/reservas');   //Coleccion de firebase...
            },
          ),
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Cancha #2',
            textColor: Colors.white,
            onTap: () {
              GoRouter.of(context)
                  .push('/reservas');
            },
          ),
          CustomCard(
            imagePath: 'assets/images/volleyball.png',
            text: 'Cancha #3',
            textColor: Colors.white,
            onTap: () {
              GoRouter.of(context)
                  .push('/reservas');
            },
          ),
        ],
      ),
    );
  }
}
