import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tule/core/models/menu_item_model.dart';
import 'package:tule/core/services/menu_data_api.dart';
import 'package:tule/locator.dart';

class MenuItemModelCRUD extends ChangeNotifier {
  MenuDataApi _api = locator<MenuDataApi>();

  //local menu adding items
  List<MenuItemModel> _menu = [];

  UnmodifiableListView<MenuItemModel> get menu {
    return UnmodifiableListView(_menu);
  }

  int get menuSize {
    return _menu.length;
  }

  void addItem(MenuItemModel itemModel) {
    _menu.add(itemModel);
    notifyListeners();
  }

  void removeItem(MenuItemModel itemModel) {
    _menu.remove(itemModel);
    notifyListeners();
  }

  // firebase menu functionality

  List<MenuItemModel> _allMenus;

  Future<List<MenuItemModel>> getAllMenus() async {
    var result = await _api.getDocuments();
    _allMenus = result.documents
        .map((doc) => MenuItemModel.fromJson(doc.data))
        .toList();
    return _allMenus;
  }

  Stream<QuerySnapshot> getMenuAsStream() {
    return _api.streamDocuments();
  }

  Future<MenuItemModel> getMenuById(String id) async {
    var result = await _api.getDocumentById(id);
    return MenuItemModel.fromJson(result.data);
  }

  Future addMenuItems(List<MenuItemModel> items) async {
    for (MenuItemModel v in items) {
      var imageUrl = await _api.addImage(v.image);
      if (imageUrl != null) {
        v.foodImageUrl(imageUrl);
        await _api.addDocument(v.toJson());
      }
    }
    return;
  }

  Future<void> updateMenuItem(String id, MenuItemModel data) async {
    return await _api.updateDocument(id, data.toJson());
  }

  Future<void> deleteDocument(String id, MenuItemModel data) async {
    await _api.removeDocument(id, data);
    notifyListeners();
    return;
  }
}
