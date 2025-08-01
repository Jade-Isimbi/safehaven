
import 'package:flutter/material.dart';
import '../../../menu/presentation/pages/menu_page.dart';
import '../../../gbv/presentation/pages/gbv_page.dart';
import '../../../coping/presentation/pages/coping_page.dart';
import '../../../rights/presentation/pages/rights_page.dart';
import '../../../support/presentation/pages/support_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../splash/presentation/pages/splash_page.dart';
import '../../../onboarding/presentation/pages/onboarding_page.dart';
import '../../data/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      try {
        await _authService.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.of(context).pushReplacementNamed('/menu');
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
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
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: 'Inter',
                            fontSize: 16,
                          ),
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
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 61,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontFamily: 'Inter',
                            fontSize: 16,
                          ),
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
                        ),
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
                    SizedBox(
                      width: 300,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                             Navigator.pushNamed(context, '/forgotPassword');
                          }, 
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              color: Color(0XFF9E182B)
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 182,
                      height: 61,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9E182B),
                          foregroundColor: Color(0xFFF5F5DC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 44),
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
                        TextButton(
                          onPressed: () {
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}