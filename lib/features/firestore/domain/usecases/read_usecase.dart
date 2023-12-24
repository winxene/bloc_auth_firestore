import '../../data/models/data_model.dart';
import '../../../../core/firestore/firestore_manager.dart';

class ReadUseCase {
  final FirestoreManager _firestoreManager;

  ReadUseCase(this._firestoreManager);

  Stream<List<DataModel>> readDocuments(String collectionPath) {
    return _firestoreManager
        .getCollection(collectionPath)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DataModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  //get specific document usecase
}
