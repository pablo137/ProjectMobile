import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/domain/models/canchas_model.dart';
import 'package:proyect/repository/canchas.dart';
import 'package:proyect/widgets/cards/customCard.dart';
import 'package:proyect/widgets/cards/customCardList.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';


// class listas_model{
//   List<Cancha> canchasFut = [];
//   List<Cancha> canchasWall = [];
//   CanchasRepository _canchaRepository = CanchasRepository();
//   @override
//   void initState() {
//     // Wait for the data to be loaded.
//     _canchaRepository.fetchReservationCanchas().then((canchaObtenidos) {
//         if (canchaObtenidos.isNotEmpty) {
//           for(var i = 0; i < canchaObtenidos.length; i++) {
//             if(i<3){
//               canchasFut.add(canchaObtenidos[i]);
//               print(canchasFut);
//             }else{
//               canchasWall.add(canchaObtenidos[i]);
//               print(canchasWall);
//             }
//           }
//         }
//       });
//     }
//     //super.initState();
//   }


class WallyRaquet extends StatelessWidget {
  

  const WallyRaquet({Key? key}) : super(key: key);
  
  get cardList => null;

  
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
                  .push('/reservas');   
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
