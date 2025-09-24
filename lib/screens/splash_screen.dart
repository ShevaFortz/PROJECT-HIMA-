import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Navigasi ke Login setelah delay

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay 3 detik lalu navigasi ke LoginScreen (sesuai aturan: sebelum masuk ke halaman login)
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // Tema oranye HIMA
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Aplikasi (sesuai aturan)
            Image.asset(
              "assets/Logo2.png",
              height: 150,
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                // Fallback jika logo tidak ada
                return Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: const Icon(Icons.school,
                      size: 100, color: Colors.deepOrange),
                );
              },
            ),
            const SizedBox(height: 20),
            // Nama Aplikasi (sesuai aturan)
            const Text(
              "HIMA Informatika\nKampus 5",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            // Nama Pembuat Aplikasi (sesuai aturan)
            const Text(
              "Dibuat oleh: MUHAMMAD REYHAN SHEVA RIZQULAH \n(Versi 1.0)",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            // Loading indicator untuk efek splash
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
