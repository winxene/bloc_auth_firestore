import 'package:flutter_auth_firestore_test/core/firestore/firestore_manager.dart';
import '../../data/models/data_model.dart';

class CreateUseCase {
  final FirestoreManager _firestoreManager;

  CreateUseCase(this._firestoreManager);

  Future<void> createDocument(DataModel model, String collectionPath) {
    return _firestoreManager.addDocument(
        collectionPath, model.id, model.toMap());
  }
}
