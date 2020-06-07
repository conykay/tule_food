import 'package:cloud_firestore/cloud_firestore.dart';

class KitchenDataApi {
  Firestore _firestore = Firestore.instance;
  CollectionReference ref;

  KitchenDataApi() {
    ref = _firestore.collection('Kitchens');
  }

  Future<QuerySnapshot> getDocumentsCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> addDocument(Map data, String id) {
    return ref.document(id).setData(data);
  }

  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }
}
