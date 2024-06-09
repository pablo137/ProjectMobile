// import 'package:flutter/material.dart';

// class SketchPage extends StatelessWidget {
//   const SketchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Croquis'),
//       ),
//       body: Center(
//         child: Image.asset(
//           'assets/images/croquis.jpeg', // Asegúrate de que la imagen esté en esta ruta
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
//########################

// import 'package:flutter/material.dart';

// class SketchPage extends StatelessWidget {
//   const SketchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Croquis'),
//       ),
//       body: Container(
//         color: colors.primary, // Fondo usando el color primario del tema
//         child: Center(
//           child: InteractiveViewer(
//             panEnabled: true,
//             boundaryMargin: const EdgeInsets.all(20.0),
//             minScale: 0.5,
//             maxScale: 4.0,
//             child: Image.asset(
//               'assets/images/croquis.jpeg', // Asegúrate de que la imagen esté en esta ruta
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class SketchPage extends StatelessWidget {
  const SketchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Croquis'),
      ),
      body: Container(
        color: colors.primary, // Fondo usando el color primario del tema
        child: Center(
          child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: EdgeInsets.zero,
            minScale: 0.5,
            maxScale: 4.0,
            child: Image.asset(
              'assets/images/croquis.jpeg', // Asegúrate de que la imagen esté en esta ruta
              width: MediaQuery.of(context).size.width, // Ancho de la imagen igual al ancho de la pantalla
              height: MediaQuery.of(context).size.height, // Alto de la imagen igual al alto de la pantalla
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
