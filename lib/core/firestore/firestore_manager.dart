import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get a document
  Future<DocumentSnapshot> getDocument(
      String collectionPath, String documentId) {
    return _firestore.collection(collectionPath).doc(documentId).get();
  }

  // Add a new document
  Future<void> addDocument(String collectionPath, Map<String, dynamic> data) {
    return _firestore.collection(collectionPath).add(data);
  }

  // Update an existing document
  Future<void> updateDocument(
      String collectionPath, String documentId, Map<String, dynamic> data) {
    return _firestore.collection(collectionPath).doc(documentId).update(data);
  }

  // Delete a document
  Future<void> deleteDocument(String collectionPath, String documentId) {
    return _firestore.collection(collectionPath).doc(documentId).delete();
  }

  // Get a collection
  CollectionReference getCollection(String collectionPath) {
    return _firestore.collection(collectionPath);
  }
}
