import 'package:flutter/material.dart';

class AppTheme{

  static const Color primary= Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(  
    
    primaryColor: Colors.indigo,

    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      elevation: 0
      
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), topRight: Radius.circular(10)
          ),
      ),
      
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), topRight: Radius.circular(10)
          ),    
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      )
    ),

  );

}
