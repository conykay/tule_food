import 'package:cloud_firestore/cloud_firestore.dart';

class KitchenDataApi {
  Firestore _firestore = Firestore.instance;
  CollectionReference _ref;

  KitchenDataApi() {
    _ref = _firestore.collection('Kitchens');
  }

  Future<QuerySnapshot> getDocumentsCollection() {
    return _ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return _ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return _ref.document(id).get();
  }

  Future<void> addDocument(Map data, String id) {
    return _ref.document(id).setData(data);
  }

  Future<void> removeDocument(String id) {
    return _ref.document(id).delete();
  }

  Future<void> updateDocument(Map data, String id) {
    return _ref.document(id).updateData(data);
  }
}
