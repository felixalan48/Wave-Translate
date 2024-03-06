import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_translate/presentation/screens/counter/interfaz_temas.dart';
import 'package:wave_translate/presentation/screens/counter/interfaz_inicio.dart';

class MenuInterfaces extends StatefulWidget {
  const MenuInterfaces({super.key});

  @override
  State<MenuInterfaces> createState() => _MainScreenState();
}

class _MainScreenState extends State<MenuInterfaces> {
  int selectedIndex = 0;

  @override
  void initState() {
    super
        .initState(); // Se realizan las operaciones de inicializacion necesarias
    cargarPreferences(); // Se cargan las preferencias del usuario
  }

  cargarPreferences() async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    bool primeraEntrada = preferencias.getBool('isFirstTime') ??
        true; // Revisa si es la primera entrada del usuario
    if (primeraEntrada) {
      // Si es la primera entreada, muestra el letrero de bienvenida y guarda primera entrada en falso para no volver a mostrar el letrero
      preferencias.setBool('isFirstTime', true);
      mostrarBienvenida();
    }
  }

  void mostrarBienvenida() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Impide que el diálogo se cierre al tocar fuera del área del diálogo
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('¡Bienvenido!')), // Centrar el título
          content: const Text(
              'Gracias por usar nuestra aplicación por primera vez, aquí podrás hacer traducciones de lenguaje español a lengua de señas. Para empezar a traducior, solo ingresa el texto que deseas traducir y luego selecciona "Traducir", o si deseas cambiar al modo obscuro, selecciona la opcion "Tema" en la parte inferior.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    final screens = [
      const InterfazInicio(),
      const InterfazTemas()
    ]; // Arreglo de interfaces


    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting, // Animacion

        currentIndex: selectedIndex,

        onTap: (value) {
          setState(() {
            selectedIndex =
                value; // Define el indice actual del arreglo dependiendo de la eleccion del usuario
          });
        },

        elevation: 0,

        items: [
         BottomNavigationBarItem(
              icon:const Icon(Icons.home_filled), // Icono inactivo
              activeIcon:const Icon(Icons.home), // Icono activo
              label: 'Inicio', // Etiqueta
              backgroundColor: colors.primary // Color de fondo personalizado
              ),
        BottomNavigationBarItem(
              // Icono de temas
              icon:const Icon(Icons.brush_outlined),
              activeIcon:const Icon(Icons.brush),
              label: 'Tema',
              backgroundColor: colors.primary // Color de fondo personalizado

          ),
        ],
      ),
    );
  }
}
