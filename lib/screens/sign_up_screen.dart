import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tule/screens/create_account_screen.dart';
import 'package:tule/screens/login_screen.dart';
import 'package:tule/widgets/registration_buttons.dart';

class SignUpScreen extends StatelessWidget {
  static final String id = 'sign_up_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    splashColor: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, LogInScreen.id);
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Hero(
                  tag: 'burger',
                  child: SvgPicture.asset('images/burger.svg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: RotateAnimatedTextKit(
                  isRepeatingAnimation: true,
                  duration: Duration(seconds: 5),
                  text: [
                    'Find foods you love',
                    'Fast Delivery',
                    'Live Tracking',
                  ],
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 55.0),
                child: Text(
                  'Discover foods from all the local hotels and individuals near you.',
                  style: TextStyle(fontSize: 15.0, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              RegistrationButton(
                buttonText: 'Create Account',
                onPressed: () =>
                    Navigator.pushNamed(context, CreateAccountScreen.id),
                padding: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
