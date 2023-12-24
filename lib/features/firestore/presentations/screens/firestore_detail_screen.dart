import 'package:flutter/material.dart';
import '../../data/models/data_model.dart';
import '../../../../core/firestore/firestore_manager.dart';
import '../../domain/usecases/read_usecase.dart';

class FirestoreDetailScreen extends StatelessWidget {
  static const String routeName = '/firestore-example/detail';

  final ReadUseCase _readUseCase = ReadUseCase(FirestoreManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Documents'),
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

          return ListView(
            children: snapshot.data!.map((DataModel model) {
              return ListTile(
                title: Text('Name: ${model.name}, Author: ${model.author}'),
                subtitle: Text('Scores: ${model.score.toString()}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
