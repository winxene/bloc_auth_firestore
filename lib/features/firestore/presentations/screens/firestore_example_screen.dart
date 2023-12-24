import 'package:flutter/material.dart';

class FirestoreExampleScreen extends StatelessWidget {
  static const String routeName = '/firestore-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Button to create (Create)
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/firestore-example/create');
                },
                child: const Text('Create')),
            //Button to show list (Read)
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/firestore-example/detail');
                },
                child: const Text('Read')),
          ],
        ),
      ),
    );
  }
}
