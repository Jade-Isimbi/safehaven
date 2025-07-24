import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 50),
          Column(
            children: [
              Image.asset('assets/images/logo.svg',
              height: 301,
              ),
            ],
            )
        ]
      ),)
  );
}
  
}
