import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    //3 seconds delay on splash screen, then go to login
    
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo image
              Image.asset(
                'assets/images/logo.png',
                height: 250,
              ),
              const SizedBox(height: 26),

              // App name
              const Text(
                'SafeHaven',
                style: TextStyle(
                  fontFamily: 'Kotta One',
                  fontSize: 28,
                  color: Color(0xFF9E182B), 
                ),
              ),

              const SizedBox(height: 102), // Spacer before the quote

              // Quote at bottom-center
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  '"It\'s okay to not be okay. Your feelings are valid, and your healing matters."',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Charm',
                    color: Color(0xFF9E182B),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}