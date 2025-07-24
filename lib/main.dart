import 'package:flutter/material.dart';
import 'package:safehaven/features/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven',
      home: const SplashPage()
    );
  }
  
}
