
import 'package:flutter/material.dart';
import 'package:proyect/pages/cachas_app/complements.dart';
class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color textColor;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 20,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Ink.image(
            image: AssetImage(imagePath),
            height: 240,
            fit: BoxFit.cover,
            colorFilter: ColorFilters.greyscale,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
