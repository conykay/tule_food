import 'package:flutter/material.dart';

class BottomInfoWidget extends StatelessWidget {
  const BottomInfoWidget({
    this.leading,
    this.buttonAction,
    this.buttonText,
  });
  final String leading;
  final Function buttonAction;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leading,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        FlatButton(
          splashColor: Colors.orangeAccent,
          onPressed: buttonAction,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 17.0,
            ),
          ),
        ),
      ],
    );
  }
}
