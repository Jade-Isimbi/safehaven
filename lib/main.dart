import 'package:flutter/material.dart';
import 'package:safehaven/features/splash/presentation/pages/splash_page.dart';
import 'package:safehaven/features/auth/presentation/pages/login_page.dart';
import 'package:safehaven/features/auth/presentation/pages/signup_page.dart';
   import 'package:safehaven/features/rating/rating_page.dart';
   import 'package:safehaven/features/support/presentation/pages/support_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHaven',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/rating': (context) => const RatingPage(),
        '/support': (context) => const SupportPage(),
      },
      // home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
  
}
