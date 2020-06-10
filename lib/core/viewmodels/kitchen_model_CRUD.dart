import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tule/core/models/kitchen_model.dart';
import 'package:tule/core/services/kitchen_data_api.dart';
import 'package:tule/locator.dart';

class KitchenModelCRUD extends ChangeNotifier {
  KitchenDataApi _api = locator<KitchenDataApi>();

  List<KitchenModel> kitchens;

  Future<List<KitchenModel>> getAllKitchens() async {
    var result = await _api.getDocumentsCollection();
    kitchens = result.documents
        .map((doc) => KitchenModel.fromJson(doc.data, doc.documentID))
        .toList();
    return kitchens;
  }

  Stream<QuerySnapshot> fetchKitchensAsStream() {
    return _api.streamDataCollection();
  }

  Future<KitchenModel> getKitchenById(String id) async {
    var doc = await _api.getDocumentById(id);
    return KitchenModel.fromJson(doc.data, doc.documentID);
  }

  Future removeKitchen(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateKitchen(KitchenModel data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addKitchen(KitchenModel data, String id) async {
    await _api.addDocument(data.toJson(), id);
  }
}
