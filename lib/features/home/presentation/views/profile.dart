import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/view_model/profile_provider.dart';
import 'package:tarek_mohammed_portfolio/features/home/presentation/views/responsive_layout.dart';

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioViewModel>(
      builder: (context, vm, child) {
        return MaterialApp(
          title: 'Tarek Mohammed | Portfolio',
          debugShowCheckedModeBanner: false,
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          themeMode: vm.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const _PortfolioScaffold(),
        );
      },
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF3C78FF),
        brightness: Brightness.dark,
        primary: const Color(0xFF3C78FF),
        secondary: const Color(0xFF00D9FF),
        surface: const Color(0xFF121218),
      ),
      scaffoldBackgroundColor: const Color(0xFF0A0A10),
      cardTheme: CardThemeData(
        color: const Color(0xFF161622),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF3C78FF),
        brightness: Brightness.light,
        primary: const Color(0xFF3C78FF),
        secondary: const Color(0xFF0099CC),
        surface: const Color(0xFFF5F5F5),
      ),
      scaffoldBackgroundColor: const Color(0xFFF0F0F5),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _PortfolioScaffold extends StatelessWidget {
  const _PortfolioScaffold();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      body: const ResponsiveLayout(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => vm.toggleTheme(),
        tooltip: vm.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        backgroundColor: theme.colorScheme.primary,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: animation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Icon(
            vm.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            key: ValueKey(vm.isDarkMode),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
