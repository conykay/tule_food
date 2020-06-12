import 'package:cloud_firestore/cloud_firestore.dart';

class KitchenModel {
  String kid;
  String kitchenName;
  String description;
  String kitchenLocation;
  GeoPoint geoPointLocation;

  KitchenModel({
    this.kid,
    this.kitchenLocation,
    this.kitchenName,
    this.description,
    this.geoPointLocation,
  });

  KitchenModel.fromJson(Map snapshot, String id)
      : geoPointLocation = snapshot['location'] ?? null,
        kitchenLocation = snapshot['kitchenLocation'] ?? '',
        kitchenName = snapshot['kitchenName'] ?? '',
        description = snapshot['description'] ?? '';

  toJson() {
    return {
      "geoPointLocation": geoPointLocation,
      "description": description,
      "kitchenLocation": kitchenLocation,
      "kitchenName": kitchenName,
    };
  }
}
