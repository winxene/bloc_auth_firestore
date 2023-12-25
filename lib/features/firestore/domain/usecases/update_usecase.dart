import '../../../../core/firestore/firestore_manager.dart';
import '../../data/models/data_model.dart';

class UpdateUseCase {
  final FirestoreManager _firestoreManager;

  UpdateUseCase(this._firestoreManager);

  Future<void> updateDocument(
      String collectionPath, String documentId, DataModel model) {
    return _firestoreManager.updateDocument(
        collectionPath, documentId, model.toMap());
  }
}
