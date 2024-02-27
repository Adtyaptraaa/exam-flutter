import 'package:flutter/material.dart';
import 'getstarted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Mengatur opacity menjadi 1 secara perlahan dalam durasi 2 detik
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Setelah 4 detik, pindah ke halaman GetStartedPage
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GetStartedPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1), // Durasi animasi
          opacity: _opacity, // Nilai opacity
          child: Image.asset(
            'assets/images/splash.png', // Path gambar PNG
            width: 400, // Atur lebar sesuai kebutuhan
            height: 400, // Atur tinggi sesuai kebutuhan
          ),
        ),
      ),
    );
  }
}
