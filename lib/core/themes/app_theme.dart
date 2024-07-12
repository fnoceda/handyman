import 'package:flutter/material.dart';
/*
*creamos una lista de colores pre establecida para poder cambiar el theme
* de la app desde un provider
* hacemos constante para que se pueda instanciar desde los providers
*/
const colorListProviderReference = <Color>[
  Color.fromARGB(255, 13, 71, 161),
  Colors.black,
  Colors.yellow,
  Colors.amber,
  Colors.indigo,
  Colors.blue,
  Colors.white,
  Colors.red,
  Colors.purple,
  Colors.green,
  Colors.orange,
];
const colorTitleSecondary = <Color>[
  Colors.white,
  Colors.black,
];

class AppTheme {
  final int selectColor;
  final int selectColorSecondary;
  final bool isDarkMode;
  final Color background; 

  AppTheme({
    this.selectColor = 0, 
    this.selectColorSecondary = 0,
    this.isDarkMode = false,
    this.background = const Color(0xFFF2F3F8),
    }): assert(selectColor >= 0, 'Selected Color must greater then 0'),
        assert(selectColor < colorListProviderReference.length,'Selected Color must be less or equal than ${colorListProviderReference.length - 1}'),
        assert(selectColorSecondary >= 0, 'Selected Color must greater then 0'),
        assert(selectColorSecondary < colorTitleSecondary.length,'Selected Color Secondary must be less or equal than ${colorListProviderReference.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorListProviderReference[selectColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: background,
      appBarTheme:  AppBarTheme(backgroundColor:background),
      drawerTheme:  DrawerThemeData(backgroundColor:background),
      iconTheme: IconThemeData(color: colorTitleSecondary[selectColorSecondary],size: 25),
      );

  //* copiamos el colortheme para poder aplicar colores y el modo oscuro
  AppTheme copyWith({int? selectColor, bool? isDarkMode,Color? background}) => AppTheme(
      selectColor: selectColor ?? this.selectColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      background: background ?? this.background,
  );
}