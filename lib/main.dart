import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tule/core/viewmodels/kitchen_model_CRUD.dart';
import 'package:tule/core/viewmodels/menu_item_model_CRUD.dart';
import 'package:tule/core/viewmodels/user_model_CRUD.dart';
import 'package:tule/ui/screens/create_account_screen.dart';
import 'package:tule/ui/screens/forgot_password_screen.dart';
import 'package:tule/ui/screens/get_started_screen.dart';
import 'package:tule/ui/screens/home_screen.dart';
import 'package:tule/ui/screens/login_screen.dart';
import 'package:tule/ui/screens/open_kitchen_screen.dart';
import 'package:tule/ui/screens/sign_up_screen.dart';

import 'locator.dart';

void main() => runApp(Tule());

class Tule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuItemModelCRUD>(
          create: (_) => locator<MenuItemModelCRUD>(),
        ),
        ListenableProvider<KitchenModelCRUD>(
            create: (_) => locator<KitchenModelCRUD>()),
        ChangeNotifierProvider<UserModelCRUD>(
          create: (_) => UserModelCRUD(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: Colors.orangeAccent,
            appBarTheme: AppBarTheme(
                elevation: 0.0,
                color: Colors.white,
                iconTheme:
                    IconThemeData(color: Colors.deepOrange, size: 20.0))),
        initialRoute: GetStartedScreen.id,
        routes: {
          GetStartedScreen.id: (context) => GetStartedScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          CreateAccountScreen.id: (context) => CreateAccountScreen(),
          LogInScreen.id: (context) => LogInScreen(),
          ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          OpenKitchenScreen.id: (context) => OpenKitchenScreen(),
        },
      ),
    );
  }
}
