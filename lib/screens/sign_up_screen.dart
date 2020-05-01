import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  static final String id = 'sign_up_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 40.0),
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
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SvgPicture.asset('images/burger.svg'),
              ),
              Text(
                'Find foods you love',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Discover foods from all the local hotels and individuals near you.',
                style: TextStyle(fontSize: 15.0, color: Colors.black45),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
