class UserModel {
  String id;
  String name;
  String email;
  bool kitchen;
  String Kid;

  UserModel(this.id, {this.name, this.email, this.kitchen, this.Kid});

  UserModel.fromJson(Map snapshot, String id)
      : name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        kitchen = snapshot['kitchen'] ?? false,
        Kid = snapshot['Kid'] ?? '';

  toJson() {
    return {
      "name": name,
      "email": email,
      "kitchen": kitchen,
      "Kid": Kid,
    };
  }
}
