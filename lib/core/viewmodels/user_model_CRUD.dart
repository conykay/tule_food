import 'package:flutter/cupertino.dart';
import 'package:tule/core/models/user_model.dart';
import 'package:tule/core/services/user_data_api.dart';
import 'package:tule/locator.dart';

class UserModelCRUD extends ChangeNotifier {
  UserDataApi _api = locator<UserDataApi>();

  List<UserModel> usermodels;

  Future addUserModel(UserModel data) async {
    await _api.addDocument(data.toJson(), data.id);
    return;
  }

  Future editUserModel(UserModel data) async {
    await _api.updateDocument(data.toJson(), data.id);
  }
}
