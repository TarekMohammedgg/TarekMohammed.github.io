import 'package:flutter/material.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/responsive_layout.dart';

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarek Mohammed | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        // Blue Color Schema
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3C78FF), // Primary Blue
          brightness: Brightness.dark,
          primary: const Color(0xFF3C78FF), // Blue for primary elements
          secondary: const Color(0xFF00D9FF), // Cyan accent for contrast
          surface: const Color(0xFF121218), // Dark background
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0A10), // Very dark blue/grey
        cardTheme: CardThemeData(
          color: const Color(0xFF161622), // Dark Card Background
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const ResponsiveLayout(),
    );
  }
}
