import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/core/auth/auth_manager.dart';

class AuthPage extends StatelessWidget {
  final AuthManager _authManager = AuthManager();

  static const routeName = '/auth';

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
              onPressed: () {
                //making sure that UI is updated after the user is signed in (synchronously)
                final BuildContext currentContext = context;
                _authManager.signInWithGoogle().then((_) {
                  if (_authManager.getCurrentUser() != null) {
                    Navigator.of(currentContext).pushReplacementNamed('/home');
                  }
                }).catchError((e) {
                  ScaffoldMessenger.of(currentContext).showSnackBar(
                    SnackBar(content: Text('Sign-in failed: $e')),
                  );
                });
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
