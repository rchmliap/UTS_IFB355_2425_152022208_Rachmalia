import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'screens/splash_screen.dart';
import 'navigation/layout_navbar.dart';
import 'providers/cart_provider.dart'; // Import CartProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(), // Menginisialisasi CartProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scentify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
