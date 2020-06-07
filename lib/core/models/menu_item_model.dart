import 'dart:io';

class MenuItemModel {
  File foodImgUrl;
  String name;
  String price;
  String prepTime;

  MenuItemModel({this.foodImgUrl, this.name, this.price, this.prepTime});

  MenuItemModel.fromJson(Map snapshot)
      : foodImgUrl = snapshot['foodImgUrl'] ?? '',
        name = snapshot['name'] ?? '',
        price = snapshot['price'] ?? '',
        prepTime = snapshot['prepTime'];

  toJson() {
    return {
      "name": name,
      "price": price,
      "foodImgUrl": foodImgUrl,
      "prepTime": prepTime,
    };
  }

  //todo:make model firebase friendly and create its api and viewModel, also create the database

}
