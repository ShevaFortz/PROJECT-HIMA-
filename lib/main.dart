import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Navigasi ke SplashScreen pertama

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIMA Informatika Kampus 5',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: const SplashScreen(), // Mulai dari SplashScreen (sesuai aturan)
      debugShowCheckedModeBanner: false,
    );
  }
}
