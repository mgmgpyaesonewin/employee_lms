import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {


   static SharedPreferences prefs;
  // static const FirebaseUser userLogin;


  
  static Color lightPrimary = Color.fromARGB(79, 131, 204, 1);
  static Color darkPrimary = Color.fromARGB(0, 47, 108, 1);
  static Color lightAccent = Colors.blueGrey[900];
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;
  static Color white = Colors.white;

  static ThemeData lightTheme = ThemeData(
    
      backgroundColor: lightBG,
      primaryColor: Color.fromARGB(1,79,131,204),
      accentColor: Color.fromARGB(1, 204, 79, 131),
      cursorColor: lightAccent,
      
      scaffoldBackgroundColor: lightBG,
      appBarTheme: AppBarTheme(
        elevation: 0
        
        
      ));

  
}