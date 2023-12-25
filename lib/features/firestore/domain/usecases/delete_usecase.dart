import '../../../../core/firestore/firestore_manager.dart';

class DeleteUseCase {
  final FirestoreManager _firestoreManager;

  DeleteUseCase(this._firestoreManager);

  Future<void> deleteDocument(String collectionPath, String documentId) {
    return _firestoreManager.deleteDocument(collectionPath, documentId);
  }
}
