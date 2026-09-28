import 'package:flutter/material.dart';
import 'screens/catalogo_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B7658),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: const Color(0xFFF5F5F2),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F5F2),
          foregroundColor: Color(0xFF252525),
          elevation: 0,
          centerTitle: false,
        ),

        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF252525),
          foregroundColor: Colors.white,
        ),
      ),

      home: const CatalogoScreen(),
    );
  }
}

