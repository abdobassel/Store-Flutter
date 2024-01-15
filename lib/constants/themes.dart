import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  useMaterial3: true,
  progressIndicatorTheme:
      ProgressIndicatorThemeData(circularTrackColor: Colors.deepOrange),
  inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(color: Colors.blue)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white),
      backgroundColor: Colors.white),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
  ),
);

ThemeData darkTheme = ThemeData(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Color(0xff313737),
  useMaterial3: false,
  cardTheme: CardTheme(color: Color(0xff464f4f)),
  hintColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      fillColor: Colors.white),
  indicatorColor: Colors.white,
  appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff313737)),
      backgroundColor: Color(0xff313737)),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff313737),
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
  ),
);
