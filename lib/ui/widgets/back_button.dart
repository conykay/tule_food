import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({this.onPressed});
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'back',
      child: FlatButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios),
        label: Text(''),
      ),
    );
  }
}
