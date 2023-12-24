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
            ElevatedButton(onPressed: () {}, child: const Text('Read')),
            //Button to update (Update)
            ElevatedButton(onPressed: () {}, child: const Text('Update')),
            //Button to delete (Delete)
            ElevatedButton(onPressed: () {}, child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
