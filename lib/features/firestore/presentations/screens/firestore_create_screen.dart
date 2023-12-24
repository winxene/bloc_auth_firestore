import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/core/firestore/firestore_manager.dart';
import 'package:flutter_auth_firestore_test/features/firestore/domain/usecases/create_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/firestore_create_bloc.dart';

class FirestoreCreateScreen extends StatelessWidget {
  static const String routeName = '/firestore-example/create';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _scoreControllers = {
    'Reviewer1': TextEditingController(),
    'Reviewer2': TextEditingController(),
    // Add more reviewers here
  };

  @override
  Widget build(BuildContext context) {
    final _firestoreManager = FirestoreManager();
    final _createUseCase = CreateUseCase(_firestoreManager);
    return BlocProvider(
      create: (context) => CreateBloc(_createUseCase),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Document'),
        ),
        body: BlocConsumer<CreateBloc, CreateState>(
          listener: (context, state) {
            if (state is CreateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Document created successfully')),
              );
            } else if (state is CreateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Failed to create document: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  // Add your form fields here
                  ElevatedButton(
                    onPressed: state is! CreateLoading
                        ? () => _createDocument(context)
                        : null,
                    child: Text('Create Document'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _createDocument(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Map<String, double> scores = _scoreControllers
          .map((key, value) => MapEntry(key, double.parse(value.text)));
      context.read<CreateBloc>().add(CreateDocumentEvent(
            _nameController.text,
            _authorController.text,
            scores,
          ));
    }
  }
}