import 'package:flutter/material.dart';
import 'features/menu/presentation/pages/menu_page.dart';
import 'features/gbv/presentation/pages/gbv_page.dart';
import 'features/coping/presentation/pages/coping_page.dart';
import 'features/rights/presentation/pages/rights_page.dart';
import 'features/support/presentation/pages/support_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'features/onboarding/presentation/pages/onboarding_page.dart';

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
      home: const MenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}