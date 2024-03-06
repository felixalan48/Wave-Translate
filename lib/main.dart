import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wave_translate/presentation/screens/counter/menu_interfaces.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      
      debugShowCheckedModeBanner: false,

      home:MenuInterfaces(),
    );
  }
}