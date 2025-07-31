import 'package:flutter/material.dart';
import 'package:safehaven/features/splash/presentation/pages/splash_page.dart';
import 'package:safehaven/features/auth/presentation/pages/login_page.dart';
import 'package:safehaven/features/auth/presentation/pages/signup_page.dart';
import 'package:safehaven/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:safehaven/features/rating/rating_page.dart';
import 'package:safehaven/features/support/presentation/pages/support_page.dart';
import 'package:safehaven/features/gbv/presentation/pages/gbv_page.dart'; // ← ADD THIS
import 'package:safehaven/features/gbv/presentation/pages/helpvictim_page.dart'; // ← ADD THIS
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'features/menu/presentation/pages/menu_page.dart';
import 'features/rights/presentation/providers/rights_provider.dart';
import 'features/support/presentation/providers/support_provider.dart';
import 'features/auth/presentation/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RightsProvider()),
        ChangeNotifierProvider(create: (_) => SupportProvider()),
      ],
      providers: [ChangeNotifierProvider(create: (_) => RightsProvider())],
      child: MaterialApp(
        title: 'SafeHaven',
        initialRoute: '/support',
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupPage(),
          '/forgotPassword': (context) => const ForgotPasswordPage(),
          '/menu': (context) => const MenuPage(),
          '/rating': (context) => const RatingPage(),
          '/support': (context) => const SupportPage(),
          '/gbv': (context) => const GbvPage(), // ← ADD THIS
          '/help-victim': (context) => const HelpVictimPage(), // ← ADD THIS
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
