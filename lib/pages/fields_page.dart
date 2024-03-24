import 'package:flutter/material.dart';
import 'package:proyect/widgets/bottomNav.dart';
import 'package:proyect/widgets/sideBar.dart';

class Fields extends StatefulWidget {
  const Fields({super.key});

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: SideBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 25.0), // Establece el relleno solo en la parte superior
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Alinea los elementos a la izquierda
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CANCHAS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Espacio entre el texto y el Card
              Card(
                elevation: 20,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/volleyball.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          '     WALLY     ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BottomNav(), // Agregar tu BottomNav() aquí
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: colors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        // title: const Align(

        //     alignment: Alignment.centerRight,
        //     child: Text(
        //       'Canchas',
        //       textAlign: TextAlign.right,
        //     )),

        title: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/ReservaYaHorizontal.png',
              height: 90,
              // Ajusta el fit de la imagen según tus necesidades
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
