import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitileRowWidget extends StatelessWidget {
  const TitileRowWidget({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200.0,
          child: TypewriterAnimatedTextKit(
            speed: Duration(
              milliseconds: 250,
            ),
            text: [title],
            isRepeatingAnimation: false,
            textStyle: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 35.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: Hero(
            tag: 'burger',
            child: SvgPicture.asset(
              'images/burger.svg',
              height: 50.0,
              width: 50.0,
            ),
          ),
        ),
      ],
    );
  }
}
