import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/core/firestore/firestore_manager.dart';
import 'package:flutter_auth_firestore_test/features/firestore/domain/usecases/create_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/firestore_bloc.dart';
import '../widgets/firestore_score_field.dart';

class FirestoreFormScreen extends StatelessWidget {
  static const String routeName = '/firestore-example/create';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final List<TextEditingController> _scoreNameControllers =
      List.generate(3, (index) => TextEditingController());
  final List<TextEditingController> _scoreValueControllers =
      List.generate(3, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final firestoreManager = FirestoreManager();
    final createUseCase = CreateUseCase(firestoreManager);
    return BlocProvider(
      create: (context) => FirestoreBloc(createUseCase),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Document'),
        ),
        body: BlocConsumer<FirestoreBloc, CreateState>(
          listener: (context, state) {
            if (state is CreateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Document created successfully')),
              );
              Navigator.pop(context); // Add this line
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
                padding: const EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: const InputDecoration(
                      labelText: 'Author',
                    ),
                  ),
                  ..._scoreNameControllers.asMap().entries.map((entry) {
                    int index = entry.key;
                    TextEditingController nameController = entry.value;
                    TextEditingController valueController =
                        _scoreValueControllers[index];
                    return ScoreField(
                      nameController: nameController,
                      valueController: valueController,
                      index: index,
                    );
                  }).toList(),
                  ElevatedButton(
                    onPressed: state is! CreateLoading
                        ? () => _createDocument(context)
                        : null,
                    child: const Text('Create Document'),
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
      Map<String, double> scores = _scoreNameControllers.asMap().map(
          (index, nameController) => MapEntry(nameController.text,
              double.parse(_scoreValueControllers[index].text)));
      context.read<FirestoreBloc>().add(CreateDocumentEvent(
            _nameController.text,
            _authorController.text,
            scores,
          ));
    }
  }
}
