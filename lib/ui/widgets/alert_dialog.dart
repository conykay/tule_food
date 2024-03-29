import 'package:flutter/material.dart';

class TuleAlertDialog extends StatelessWidget {
  final String title;
  final Widget widget;
  final List<Widget> actions;
  const TuleAlertDialog({Key key, this.title, this.widget, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: widget,
      elevation: 24.0,
      backgroundColor: Colors.orangeAccent,
      actions: actions,
    );
  }
}
