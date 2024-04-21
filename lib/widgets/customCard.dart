import 'package:flutter/material.dart';
import 'package:proyect/presentation/pages/cachas_app/complements.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color textColor;
  final VoidCallback? onTap;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.textColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
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
                onTap: onTap,
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
      ),
    );
  }
}
