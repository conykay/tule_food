import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    this.buttonText,
    this.onPressed,
    this.padding,
  });

  final Function onPressed;
  final String buttonText;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: 55.0,
        width: double.infinity,
        child: FlatButton(
          onPressed: onPressed,
          splashColor: Colors.orangeAccent,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            ),
          ),
          color: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}
