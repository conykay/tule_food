import 'package:flutter/material.dart';
import 'package:tule/screens/add_menu_item_screen.dart';
import 'package:tule/screens/create_account_screen.dart';
import 'package:tule/screens/forgot_password_screen.dart';
import 'package:tule/screens/get_started_screen.dart';
import 'package:tule/screens/home_screen.dart';
import 'package:tule/screens/login_screen.dart';
import 'package:tule/screens/open_kitchen_screen.dart';
import 'package:tule/screens/sign_up_screen.dart';

void main() => runApp(Tule());

class Tule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.orangeAccent,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.deepOrange, size: 20.0))),
      initialRoute: GetStartedScreen.id,
      routes: {
        GetStartedScreen.id: (context) => GetStartedScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        CreateAccountScreen.id: (context) => CreateAccountScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        OpenKitchenScreen.id: (context) => OpenKitchenScreen(),
        AddMenuItems.id: (context) => AddMenuItems(),
      },
    );
  }
}
