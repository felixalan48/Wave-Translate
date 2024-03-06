import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_translate/providers/tema_providers.dart';

class InterfazTemas extends StatefulWidget {
  const InterfazTemas({super.key});

  @override
  State<InterfazTemas> createState() => _InterfazTemasState();
}

class _InterfazTemasState extends State<InterfazTemas> {

  final temaController = Get.put(TemaProvider());
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Tema',
          style: TextStyle(
            fontSize: 18.0, // Tamaño de letra ajustado
            fontWeight: FontWeight.bold, // Texto un poco más grueso
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context)
            .appBarTheme
            .backgroundColor, // Usar el color de fondo del tema actual
      ),
      
      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(height: 10), // Espacio entre los botones

          Center(
            child: SizedBox(
            width: 400, // Ancho deseado del botón
            child: ElevatedButton(
              onPressed: () {
                if (Theme.of(context).brightness == Brightness.dark) {
                  temaController.temaClaro();
                } else {
                  temaController.temaObscuro();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Cambiado primary para establecer el color del botón
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Modo obscuro', // Texto constante
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      if (value) {
                        temaController.temaObscuro();
                      } else {
                        temaController.temaClaro();
                      }
                    },
                    activeColor: Colors.blueGrey,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          )

          
        ],
      ),

    );
  }
}
//              onPressed: () => tema.setTema(ThemeData.light())
