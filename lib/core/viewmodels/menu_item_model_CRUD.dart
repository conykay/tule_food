import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:tule/core/models/menu_item_model.dart';

class MenuItemModelCRUD extends ChangeNotifier {
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
}
