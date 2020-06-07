import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataApi {
  final Firestore _db = Firestore.instance;
  CollectionReference reference;

  UserDataApi() {
    reference = _db.collection('UserDetails');
  }

  Future<QuerySnapshot> getDataCollection() {
    return reference.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return reference.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return reference.document(id).get();
  }

  Future<void> addDocument(Map data, String id) {
    return reference.document(id).setData(data);
  }

  Future<void> removeDocument(String id) {
    return reference.document(id).delete();
  }

  Future<void> updateDocument(Map data, String id) {
    return reference.document(id).updateData(data);
  }
}
