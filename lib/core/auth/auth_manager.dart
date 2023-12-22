import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static String? appleAuthorizationCode;
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign in failed');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signInWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      appleProvider.addScope('email');

      if (kIsWeb) {
        // Once signed in, return the UserCredential
        await _auth.signInWithPopup(appleProvider);
      } else {
        final userCred = await _auth.signInWithProvider(appleProvider);
        AuthManager.appleAuthorizationCode =
            userCred.additionalUserInfo?.authorizationCode;
      }
    } catch (e) {
      throw Exception('Failed to sign in with Apple: $e');
    }
  }
}
