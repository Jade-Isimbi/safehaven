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
                  const SizedBox(height: 10),

                  Text(
                    'SafeHaven',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Kotta One',
                      color: Color(0xFF9E182B)
                    ),
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: 300,
                    height: 61,
                    child:  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 2
                        ),  
                      ),
                    
                      prefixIcon: Image.asset('assets/images/User.png'),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFF2AFBC),
                        width: 2
                        )
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0XFF9E182B),
                          width: 2,
                        )
                      )

                    ),
                  ),
                  ),

                  const SizedBox(height: 30),
                  
                   SizedBox(
                    width: 300,
                    height: 61,
                    child:  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 2
                        ),  
                      ),
                    
                      prefixIcon: Image.asset('assets/images/Lock.png'),

                      suffixIcon: Image.asset('assets/images/Eye_off.png'),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFFF2AFBC),
                        width: 2
                        )
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0XFF9E182B),
                          width: 2,
                        )
                      )

                    ),
                  ),
                  ),

                  const SizedBox(height: 8),
                  
                  //forgot paaword link
                  SizedBox(
                    width: 300,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {

                      }, 
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Color(0XFF9E182B)
                        ),
                        )
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  //login button
                  SizedBox(
                    width: 182,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO add fibase login logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9E182B),
                        foregroundColor: Color(0xFFF5F5DC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      child: const Text('LOGIN',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                      ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 44),

                  //go to sign up page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                        ),
                      ),
                      TextButton(onPressed: () {
                        //TODO navigate to login
                      }, 
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Color(0xFF9E182B)
                        ),
                        ),
                      ),

                    ],
                  ),

                ],
              )
            ),
          ),
        )
      )
    );
  }
} 