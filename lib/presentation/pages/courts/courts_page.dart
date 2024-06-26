import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect/presentation/blocs/courts/courts_bloc.dart';
import 'package:proyect/presentation/blocs/courts/courts_event.dart';
import 'package:proyect/presentation/blocs/courts/courts_state.dart';
import 'package:proyect/widgets/cards/customCard.dart';
import 'package:proyect/widgets/nav_bars/bottomNav.dart';
import 'package:proyect/widgets/cards/customCardList.dart';
import 'package:proyect/widgets/nav_bars/sideBar.dart';
import 'package:proyect/widgets/nav_bars/topBar.dart';

class Courts extends StatelessWidget {
  const Courts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CourtsBloc(),
      child: BlocBuilder<CourtsBloc, CourtsState>(
        builder: (context, state) {
          BlocProvider.of<CourtsBloc>(context)
              .add(CourtsEvent.navigateToCourts);
          return Scaffold(
            drawer: const SideBar(),
            appBar: const TopBar(),
            body: CustomCardList(
              title: "Canchas",
              cardList: [
                CustomCard(
                  imagePath: 'assets/images/futbol (1).png',
                  text: 'Futbol 8',
                  textColor: Colors.white,
                  onTap: () {
                    BlocProvider.of<CourtsBloc>(context)
                        .add(CourtsEvent.selectFutbol8);
                    GoRouter.of(context).push(Uri(path: '/futbol8').toString());
                  },
                ),
                CustomCard(
                  imagePath: 'assets/images/wally (4).png',
                  text: 'Wally - Raquet',
                  textColor: Colors.white,
                  onTap: () {
                    BlocProvider.of<CourtsBloc>(context)
                        .add(CourtsEvent.selectWallyRaquet);
                    GoRouter.of(context)
                        .push(Uri(path: '/wally-raquet').toString());
                  },
                ),
                // Aquí puedes añadir más CustomCard
              ],
            ),
            bottomNavigationBar: BottomNav(selectedIndex: state.selectedIndex),
          );
        },
      ),
    );
  }
}
