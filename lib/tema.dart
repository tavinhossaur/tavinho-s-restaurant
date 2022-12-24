import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tema {
  static ValueNotifier<Brightness> tema = ValueNotifier(Brightness.light);

  static setTema() {
    tema.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    changeBarTheme();
  }

  // Para StatusBar e NavigationBar
  static changeBarTheme() {
    bool isDark = tema.value == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarColor:
          isDark ? const Color(0xFF424242) : const Color(0xFFFAFAFA),
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          isDark ? const Color(0xFF303030) : const Color(0xFFFAFAFA),
    ));
  }
}
