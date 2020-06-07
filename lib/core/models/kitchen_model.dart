import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tule/core/models/menu_item_model.dart';

class KitchenModel {
  String Kid;
  GeoPoint location;
  List<MenuItemModel> menuItems;

  KitchenModel(this.Kid, {this.location, this.menuItems});

  KitchenModel.fromJson(Map snapshot, String id)
      : location = snapshot['location'] ?? null,
        menuItems = snapshot['menuItems'] ?? [];

  toJson() {
    return {
      "location": location,
      "menuItems": menuItems,
    };
  }

  KitchenModel getInstance(String id) {
    KitchenModel model = new KitchenModel(id);
    return model;
  }
}
