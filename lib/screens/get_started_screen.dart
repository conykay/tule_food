import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tule/screens/home_screen.dart';
import 'package:tule/screens/sign_up_screen.dart';

var _auth = FirebaseAuth.instance;

class GetStartedScreen extends StatefulWidget {
  static final id = 'get_started_screen';

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  checkCurrentUser() async {
    var user = await _auth.currentUser();
    user != null
        ? Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false)
        : debugPrint('user not available');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 40.0, bottom: 50.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tule',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  'images/getstartedImage.svg',
                  semanticsLabel: 'tule image svg',
                ),
              ),
              Text(
                'Discover the best foods from individuals and local hotels near you. Open your own kitchen and get your food out there.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                color: Colors.white,
                textColor: Colors.black,
                child: Text(
                  'Get Started',
                  style:
                      TextStyle(fontSize: 18.0, color: Colors.deepOrangeAccent),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 30.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
