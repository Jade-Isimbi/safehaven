import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign up method
  Future<UserCredential?> signUp(String email, String password, {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Sign Up failed: ${e.code} - ${e.message}');
      return null;
    }
  }

  // Sign in method
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.code} - ${e.message}');
      return null;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
