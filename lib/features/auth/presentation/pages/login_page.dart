import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                  const SizedBox(height: 14),

                  Text(
                    'SafeHaven',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Kotta One',
                      color: Color(0xFF9E182B)
                    ),
                  ),

                  const SizedBox(height: 43),
                  
                  //email field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: Image.asset('assets/images/User.png'),
                    ),
                  ),

                  const SizedBox(height: 37),
                  //password
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: Image.asset('assets/images/Lock.png'),
                      suffixIcon: Image.asset('assets/images/Eye_off.png')
                    ),
                  ),

                  const SizedBox(height: 21),
                  
                  //forgot paaword link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {
                      //navigate to forgot password page

                    }, 
                    child: const Text('Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        color: Color(0xFF9E182B)
                      ),
                    )
                    ),
                  )

                ],
              )
            ),
          ),
        )
      )
    );
  }
} 