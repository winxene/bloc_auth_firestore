import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/core/auth/auth_manager.dart';

class AuthPage extends StatelessWidget {
  final AuthManager authManager;
  const AuthPage(this.authManager, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await authManager.signInWithGoogle();
                if (authManager.getCurrentUser() != null) {
                  Navigator.of(context).pushReplacementNamed('/home');
                }
              },
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
