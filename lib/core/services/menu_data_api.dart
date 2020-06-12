import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tule/core/models/menu_item_model.dart';

class MenuDataApi {
  Firestore _db = Firestore.instance;
  CollectionReference _ref;
  var _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  StorageReference _storageReference;
  StorageUploadTask _uploadTask;

  getUser() async {
    _user = await _auth.currentUser();
    _ref = _db.collection('Kitchens').document(_user.uid).collection('Menu');
    _storageReference = FirebaseStorage.instance.ref();
  }

  MenuDataApi() {
    getUser();
  }

  //returns all menu items
  Future<QuerySnapshot> getDocuments() {
    return _ref.getDocuments();
  }

// all menu items as stream
  Stream<QuerySnapshot> streamDocuments() {
    return _ref.snapshots();
  }

//menu item by id
  Future<DocumentSnapshot> getDocumentById(String id) {
    return _ref.document(id).get();
  }

// add menu items
  Future addDocument(Map data) {
    return _ref.document().setData(data);
  }

//update menu items
  Future updateDocument(String id, Map data) {
    return _ref.document(id).setData(data);
  }

//remove menu item
  Future removeDocument(String id, MenuItemModel data) async {
    _storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(data.foodImgUrl);
    _storageReference.delete().then((value) => _ref.document(id).delete());
  }

  Future addImage(File image) async {
    var ref = _storageReference
        .child('menus/${image.readAsString()}${image.lastModifiedSync()}');
    _uploadTask = ref.putFile(image);
    await _uploadTask.onComplete;
    print('file uploaded');
    return ref.getDownloadURL();
  }
}
