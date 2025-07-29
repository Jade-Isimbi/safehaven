import 'package:flutter/material.dart';
import 'package:safehaven/features/splash/presentation/pages/splash_page.dart';
import 'package:safehaven/features/auth/presentation/pages/login_page.dart';
import 'package:safehaven/features/auth/presentation/pages/signup_page.dart';
import 'features/menu/presentation/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage()
      },
      // home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
  
}
