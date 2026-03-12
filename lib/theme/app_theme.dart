import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryWine = Color(0xFF800000); // Sangue de Cristo
  static const Color oldBibleBeige = Color(0xFFF5E6D3); // Bíblia Velha
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color accentGold = Color(0xFFC5A059);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryWine,
        primary: primaryWine,
        secondary: accentGold,
        surface: oldBibleBeige,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryWine,
        foregroundColor: pureWhite,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryWine,
        unselectedItemColor: Colors.brown,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        type: BottomNavigationBarType.fixed,
        backgroundColor: oldBibleBeige,
      ),
      cardTheme: CardThemeData(
        color: pureWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryWine,
          foregroundColor: pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: primaryWine,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        titleLarge: TextStyle(
          color: primaryWine,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        bodyLarge: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
    );
  }
}
