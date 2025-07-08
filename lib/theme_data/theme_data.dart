

import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme:  TextTheme(
      labelSmall: TextStyle(
          color: Colors.black,
          fontSize: 11
      ),
      labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 12
      ),
      labelLarge: TextStyle(
          color: Colors.black,
          fontSize: 14
      ),
      titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 14
      ),
      titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 16
      ),
      titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 22
      ),
      displaySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 36
      ),
      displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 45
      ),
      displayLarge: TextStyle(
          color: Colors.black,
          fontSize: 57
      ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 12
      ),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 14
      ),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 16
      ),
    ),
    listTileTheme: ListTileThemeData(
        tileColor: Colors.white,
        iconColor: Colors.black
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.blue.shade400
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white
    ),
    popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
        iconColor: Colors.black,
        textStyle: TextStyle(
            color: Colors.black
        )
    ),
    iconTheme: const IconThemeData(
        color: Colors.black
    ),
    cardColor: Colors.white,
    dialogTheme: const DialogThemeData(
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 28),
        contentTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white
    ),
    navigationBarTheme:  NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue.shade400,
    ),
    searchBarTheme:  SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
    ),
    inputDecorationTheme:  InputDecorationTheme(
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.black
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.black
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.black
          )
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey.shade200,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0
    )
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1c1c1d),
      scrolledUnderElevation: 0
  ),
  scaffoldBackgroundColor: Color(0xFF1c1c1d),
  textTheme: TextTheme(
    labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 11
    ),
    labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 12
    ),
    labelLarge: TextStyle(
        color: Colors.white,
        fontSize: 14
    ),
    titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14
    ),
    titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 16
    ),
    titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 22
    ),
    displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 36
    ),
    displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 45
    ),
    displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 57
    ),
    bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12
    ),
    bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14
    ),
    bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16
    ),
  ),
  listTileTheme: const ListTileThemeData(
      tileColor: Color(0xFF333334),
      iconColor: Colors.white
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white
  ),
  popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFF1c1c1d),
      iconColor: Colors.white,
      textStyle: TextStyle(
          color: Colors.white
      )
  ),

  iconTheme: const IconThemeData(
      color: Colors.white
  ),
  cardColor: Color(0xFF333334),
  dialogTheme: const DialogThemeData(
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 28),
      contentTextStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xFF1c1c1d)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF333334)
  ),
  navigationBarTheme:  NavigationBarThemeData(
      backgroundColor: Color(0xFF1c1c1d),
      indicatorColor: Colors.black,

  ),
  searchBarTheme: const SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(Color(0xFF333334)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xFF333334),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: Colors.white
        )
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: Colors.white
        )
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
            color: Colors.white
        )
    ),
  ),
  drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF1c1c1d)
  ),
);