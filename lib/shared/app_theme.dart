import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark),
    titleTextStyle: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 20),
    iconTheme: IconThemeData(color: Colors.black87),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 20.0,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange),
  cardColor: Colors.white.withOpacity(0.85),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Colors.black87,
      fontSize: 12,
    ),

  ),
   fontFamily: "Jannah"
);


 ThemeData darkTheme= ThemeData(
   scaffoldBackgroundColor: Colors.black26,
   primarySwatch: Colors.blue,
   appBarTheme: AppBarTheme(
     color: Colors.black26,
     elevation: 0.0,
     backwardsCompatibility: false,
     systemOverlayStyle: SystemUiOverlayStyle(
         statusBarColor: Colors.black26,
         statusBarBrightness: Brightness.light,
         statusBarIconBrightness: Brightness.light),
     titleTextStyle: TextStyle(
         color: Colors.white,
         fontWeight: FontWeight.bold,
         fontSize: 20),
     iconTheme: IconThemeData(color: Colors.white),
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
       backgroundColor: Colors.deepOrange),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
       elevation: 20.0,
       backgroundColor: Colors.black26,
       type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.deepOrange,
       unselectedItemColor: Colors.grey),
   cardColor: Colors.black87.withOpacity(0.85),
   textTheme: TextTheme(
     bodyText1: TextStyle(
       color: Colors.white,
       fontWeight: FontWeight.bold,
       fontSize: 16,
     ),
     bodyText2: TextStyle(
       color: Colors.white,
       fontSize: 12,
     ),
   ),
     fontFamily: "Jannah"

 );