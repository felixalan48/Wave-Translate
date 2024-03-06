import 'package:flutter/material.dart';

class InterfazPrincipal extends StatelessWidget {
    const InterfazPrincipal({super.key});

    @override
    Widget build(BuildContext context) {
      return   Scaffold(

        appBar: AppBar(

          title: const Text('Wave Translate'),
          centerTitle: true,
          
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                Color(0xFF4C60AF),
                Color.fromARGB(255, 37, 195, 248)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

        ),
        
        body:  Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(height: 40), //Space between buttons

              const SizedBox(
                width: 300, // Define el ancho deseado

                child: Text('Bienvenido a Wave Translate, aquí podrás hacer traducciones de lenguaje español a lengua de señas. Para empezar a traducior, solo selecciona el botón "Empezar a traducir", o si deseas cambiar al modo obscuro, selecciona la opcion "tema" en la parte inferior.',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.black26, // Establecer el color del texto en blanco
                  ),
                  textAlign: TextAlign.justify, // Alinear el texto al centro
                ),
              ),

              const SizedBox(height: 40), //Space between buttons
              
              SizedBox(
                width: 300, // Ancho deseado del botón
                child: ElevatedButton(
                  onPressed: () {
                    // Función que se ejecutará cuando se presione el botón
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Función en desarrollo...'),
                      ),
                    );
                    // Lógica para mandar a la interfaz de traduccion
                  },
                  child: const Text('Traducir de español a lengua de señas',
                    style: TextStyle(
                      fontSize: 17, // Tamaño de la fuente
                      fontWeight: FontWeight.bold, // Fuente en negrita
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        

      );
    }
  }
