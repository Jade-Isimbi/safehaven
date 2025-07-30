
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      //if form is valid proceed with login
      
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // ignore: avoid_print
      print('Logging in with: $email / $password');

      //TODO FIREBASE AUTH HERE
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                    child:  TextFormField(
                      controller: _emailController,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                      // ignore: valid_regexps
                        } else if (!RegExp(r'^[\w-\.]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                          return 'Pleas enter valid email address';
                        }
                      return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 30),
                  
                   SizedBox(
                    width: 300,
                    height: 61,
                    child:  TextFormField(
                      controller: _passwordController,
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

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                      },
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
                      onPressed: _handleLogin,
                      
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
                        Navigator.pushNamed(context, '/signup');
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
          ),
        )
      )
    );
  }
}