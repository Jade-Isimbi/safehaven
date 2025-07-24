import 'package:flutter/material.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;

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
                    height: 150,
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'Welcome to SafeHaven',
                    style: TextStyle(
                      fontSize: 18,
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

                  const SizedBox(height: 15),
                  
                   SizedBox(
                    width: 300,
                    height: 61,
                    child:  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xFFFFFFFF),
                          width: 2
                        ),  
                      ),
                    
                      prefixIcon: Image.asset('assets/images/Lock.png'),

                       suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }, 
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            _obscurePassword
                                ? 'assets/images/Eye_off.png'
                                : 'assets/images/Eye.png'
                          )
                        ),
                      ),

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

                  const SizedBox(height: 15),
                  
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
                      child: const Text('SIGN UP',
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
                        "Already have an account?",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                        ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      }, 
                      child: const Text(
                        'Login',
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

