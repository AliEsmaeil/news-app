import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getDarkTheme()=>ThemeData(

    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xff0a0909),
      titleTextStyle: TextStyle(color: Colors.white),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 15,

      ),
    ),
    scaffoldBackgroundColor: const Color(0xff0a0909),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.mate(
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.w500,

      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),

    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      indicatorColor: Colors.orange,//NewsAppCubit.currentIndex == -1 ?Color(0xff0a0909): Colors.orange,
      backgroundColor: const Color(0xff0a0909),
      height: 60,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: Colors.white

        ),
      ),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Colors.white,
        size: 17,
      ),),

    ),
  dividerTheme: const DividerThemeData(
    color: Colors.grey,
    thickness: .3,
  ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 12,color: Colors.white),
      filled: true,
      fillColor: Colors.grey.shade800,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      iconColor: Colors.white,
      errorMaxLines: 1,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(width: .8,color: Colors.grey.shade700),
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
        borderSide: BorderSide(width: .8,color: Colors.grey.shade200),
      ),
    )

);