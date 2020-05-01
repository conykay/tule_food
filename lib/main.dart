import 'package:flutter/material.dart';
import 'package:tule/screens/get_started_screen.dart';
import 'package:tule/screens/sign_up_screen.dart';

void main() => runApp(Tule());

class Tule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: GetStartedScreen.id,
      routes: {
        GetStartedScreen.id : (context) => GetStartedScreen(),
        SignUpScreen.id : (context)=>SignUpScreen(),
      },
    );
  }
}
