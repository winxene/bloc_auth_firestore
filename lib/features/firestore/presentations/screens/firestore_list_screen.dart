import 'package:flutter/material.dart';
import '../../data/models/data_model.dart';
import '../../../../core/firestore/firestore_manager.dart';
import '../../domain/usecases/read_usecase.dart';
import '../../domain/usecases/delete_usecase.dart';

class FirestoreListScreen extends StatelessWidget {
  static const String routeName = '/firestore-example/list';

  final ReadUseCase _readUseCase = ReadUseCase(FirestoreManager());
  final DeleteUseCase _deleteUseCase = DeleteUseCase(FirestoreManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of'),
      ),
      body: StreamBuilder<List<DataModel>>(
        stream: _readUseCase.readDocuments('books'),
        builder:
            (BuildContext context, AsyncSnapshot<List<DataModel>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final model = snapshot.data![index];
              return ListTile(
                title: Text('Name: ${model.name}, Author: ${model.author}'),
                subtitle: Text('Scores: ${model.score.toString()}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteUseCase.deleteDocument('books', model.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
