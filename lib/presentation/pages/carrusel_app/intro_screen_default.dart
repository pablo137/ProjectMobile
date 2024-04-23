import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:proyect/presentation/pages/courts/courts_page.dart';

class IntroScreenDefault extends StatefulWidget {
  const IntroScreenDefault({super.key});

  @override
  IntroScreenDefaultState createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "PASO 1",
        description: "Busca el deporte que quieres jugar",
        pathImage: "assets/carrusel_onboarding/1.png",
        backgroundColor: Color(0xCA004953),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "PASO 2",
        description: "selecciona el lugar que prefieras",
        pathImage: "assets/carrusel_onboarding/2.png",
        backgroundColor: Color(0xCA004953),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "PASO 3",
        description: "Reserva el Horario disponible",
        pathImage: "assets/carrusel_onboarding/3.png",
        backgroundColor: Color(0xCA004953),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "PASO 4",
        description: "Realiza tu reserva y ¡Juega!",
        pathImage: "assets/carrusel_onboarding/4.png",
        backgroundColor: Color(0xCA004953),
      ),
    );
  }

  void onDonePress() {
    log("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        key: UniqueKey(),
        listContentConfig: listContentConfig,
        renderDoneBtn: const Text("Reserva"),
        onDonePress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Courts()),
          );
        },
        renderNextBtn: const Text("Siguiente"));
  }
}
