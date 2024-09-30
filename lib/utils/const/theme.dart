
import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/utils/const/colors.dart';

class AppTheme {
  static const Color accentColor = Color(0xFF7047EC);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Color(0xFFFFFFFF);

  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: primaryColor,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 24),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: cardColor,
        shadowColor: Colors.black12,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      iconTheme: const IconThemeData(
        color: primaryColor,
        size: 24,
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: Colors.white,
      //   labelStyle: const TextStyle(color: primaryColor),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: const BorderSide(color: primaryColor),
      //     borderRadius: BorderRadius.circular(8.0),
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderSide: const BorderSide(color: Colors.grey),
      //     borderRadius: BorderRadius.circular(8.0),
      //   ),
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(8.0),
      //   ),
      // ),
      tabBarTheme: const TabBarTheme(
        labelColor: primaryColor,
        unselectedLabelColor: Colors.grey,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        labelStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.0,
        ),
      ),
      pageTransitionsTheme:  PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadePageTransitionsBuilder(),
        },
      ),
    );
  }
}

class FadePageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = 0.0; // Starting opacity
    const end = 1.0; // Ending opacity
    const curve = Curves.easeInOut; // Transition curve

    // Tween to animate the opacity
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var opacityAnimation = animation.drive(tween);

    // Fade transition
    return FadeTransition(
      opacity: opacityAnimation,
      child: child,
    );
  }
}
