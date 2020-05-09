import 'package:flutter/material.dart';
import 'package:tule/screens/create_account_screen.dart';
import 'package:tule/screens/forgot_password_screen.dart';
import 'package:tule/screens/get_started_screen.dart';
import 'package:tule/screens/login_screen.dart';
import 'package:tule/screens/sign_up_screen.dart';

void main() => runApp(Tule());

class Tule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.orangeAccent,
      ),
      initialRoute: GetStartedScreen.id,
      routes: {
        GetStartedScreen.id: (context) => GetStartedScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        CreateAccountScreen.id: (context) => CreateAccountScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
      },
    );
  }
}
