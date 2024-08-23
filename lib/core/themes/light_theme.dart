import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getLightTheme()=>ThemeData(

  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 15,

    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    )
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(

    bodySmall: const TextStyle(
      fontSize: 12,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.mate(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.w500,

    ),

  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    indicatorColor: Colors.orange,//NewsAppCubit.currentIndex == -1 ? Colors.white: Colors.orange,
    backgroundColor: Colors.white,
    height: 60,
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 12,

        ),
    ),
    iconTheme: MaterialStateProperty.all(const IconThemeData(
      color: Colors.black,
      size: 17,
    ),),

  ),

  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.deepOrange),
    trackColor: MaterialStateProperty.all(Colors.orange),
  ),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: .4,
    ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(fontSize: 12,color: Colors.black),
    filled: true,
    fillColor: Colors.grey.shade200,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    prefixIconColor: Colors.black,
    errorMaxLines: 1,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: .8,color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: .8,color: Colors.orange),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: .8,color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: .8,color: Colors.grey.shade500),
    ),
  ),



);