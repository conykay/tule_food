import 'dart:io';

class MenuItemModel {
  String foodImgUrl;
  File image;
  String name;
  String price;
  String prepTime;

  MenuItemModel(
      {this.foodImgUrl, this.image, this.name, this.price, this.prepTime});

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

  foodImageUrl(String url) {
    foodImgUrl = url;
  }
}
