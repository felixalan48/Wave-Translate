import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemaProvider extends GetxController {
  late SharedPreferences preferences;
  String prefKey = "isDarkModeKey";

  void temaClaro() {
    Get.changeTheme(
      ThemeData.light().copyWith(
        colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: Colors.blue,
      ),
    ),
  );
  preferences.setBool(prefKey, false);
}


  void temaObscuro() {
    Get.changeTheme(
    ThemeData.dark().copyWith(
      colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Colors.blueGrey
      ),
    ),
  );
      
    preferences.setBool(prefKey, true);
  }

  @override
  void onInit() {
    cargarPreferencias().then((value) => cargarTema());
    super.onInit();
  }

  void cargarTema() {
    bool? isDarkMode = preferences.getBool(prefKey);

    if (isDarkMode == null) {
      preferences.setBool(prefKey, false);
      isDarkMode = false;
    }
    (isDarkMode) ? temaObscuro() : temaClaro();
  }

  Future<void> cargarPreferencias() async {
    preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
}
