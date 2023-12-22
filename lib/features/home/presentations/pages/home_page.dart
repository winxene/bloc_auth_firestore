import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/core/auth/auth_manager.dart';

class HomePage extends StatelessWidget {
  final AuthManager authManager;

  const HomePage(this.authManager, {Key? key}) : super(key: key);

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
              'Email: ${authManager.getCurrentUser()?.email}',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                authManager.signOut(); // TODO: Implement logout functionality
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
