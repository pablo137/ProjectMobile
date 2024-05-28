import 'package:flutter/material.dart';
import 'package:proyect/widgets/cards/customCard.dart';

class CustomCardList extends StatelessWidget {
  final List<CustomCard> cardList;
  final String title;

  const CustomCardList({Key? key, required this.cardList, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 25.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...cardList,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
