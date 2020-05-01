import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tule/screens/sign_up_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static final id = 'get_started_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 40.0,bottom: 50.0,top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tule', style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.w600,),),
              Expanded(child: SvgPicture.asset('images/getstartedImage.svg',semanticsLabel: 'tule image svg',),),
              Text('Discover the best foods from individuals and local hotels near you.',style: TextStyle(color: Colors.white,fontSize: 15.0,),),
              SizedBox(height: 10.0,),
              FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Get Started',style: TextStyle(fontSize: 18.0),),
                padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 30.0,),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
