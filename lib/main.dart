import 'package:flutter/material.dart';
//import 'package:safehaven/features/splash/presentation/pages/splash_page.dart';
//import 'package:safehaven/features/auth/presentation/pages/login_page.dart';
import 'package:safehaven/features/auth/presentation/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven',
      home: const SignupPage(),
      //routes: {
      //  '/login': (context) => LoginPage()
      
     // }
    );
  }
  
}
