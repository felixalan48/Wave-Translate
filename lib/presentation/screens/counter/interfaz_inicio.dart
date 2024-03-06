import 'package:flutter/material.dart';

class InterfazInicio extends StatelessWidget {
  const InterfazInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Wave Translate',
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

          const Center(
            child: SizedBox(
              width: 330,
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Ingrese el texto que desea traducir',
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20), 
          
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Función en desarrollo...'),
                ),
              );
            },
            child: const Text('Traducir'),
          ),

          


        ],
      ),

    );
  }
}
