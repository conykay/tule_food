import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog kGetProgress(BuildContext context, String title, bool custom) {
  ProgressDialog pr;
  pr = new ProgressDialog(
    context,
    isDismissible: false,
    customBody: custom ? Text(title) : null,
  );

  return pr;
}
