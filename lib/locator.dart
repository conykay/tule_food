import 'package:get_it/get_it.dart';
import 'package:tule/core/services/kitchen_data_api.dart';
import 'package:tule/core/services/menu_data_api.dart';
import 'package:tule/core/services/user_data_api.dart';
import 'package:tule/core/viewmodels/kitchen_model_CRUD.dart';
import 'package:tule/core/viewmodels/menu_item_model_CRUD.dart';

import 'core/viewmodels/user_model_CRUD.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => UserDataApi());
  locator.registerLazySingleton(() => KitchenDataApi());
  locator.registerLazySingleton(() => MenuDataApi());

  locator.registerLazySingleton(() => KitchenModelCRUD());
  locator.registerLazySingleton(() => UserModelCRUD());
  locator.registerLazySingleton(() => MenuItemModelCRUD());
}
