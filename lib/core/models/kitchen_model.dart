import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tule/core/models/menu_item_model.dart';

class KitchenModel {
  String kid;
  String kitchenName;
  String description;
  String kitchenLocation;
  GeoPoint geoPointLocation;
  List<MenuItemModel> menuItems;
  KitchenModel(
      {this.kid,
      this.kitchenLocation,
      this.kitchenName,
      this.description,
      this.geoPointLocation,
      this.menuItems});

  KitchenModel.fromJson(Map snapshot, String id)
      : geoPointLocation = snapshot['location'] ?? null,
        kitchenLocation = snapshot['kitchenLocation'] ?? '',
        kitchenName = snapshot['kitchenName'] ?? '',
        description = snapshot['description'] ?? '',
        menuItems = snapshot['menuItems'] ?? [];

  toJson() {
    return {
      "geoPointLocation": geoPointLocation,
      "menuItems": menuItems,
      "description": description,
      "kitchenLocation": kitchenLocation,
      "kitchenName": kitchenName,
    };
  }
}
