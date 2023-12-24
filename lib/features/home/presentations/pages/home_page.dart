import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/core/auth/auth_manager.dart';

class HomePage extends StatelessWidget {
  final AuthManager _authManager = AuthManager();

  //static route to home page
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'User is logged in!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Email: ${_authManager.getCurrentUser()?.email}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                _authManager.signOut();
                Navigator.of(context).pushReplacementNamed('/auth');
              },
              child: const Text('Logout'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/firestore-example');
                },
                child: const Text('Firestore Example')),
          ],
        ),
      ),
    );
  }
}
