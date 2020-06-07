import 'package:flutter/material.dart';
import 'package:tule/ui/widgets/back_button.dart';
import 'package:tule/ui/widgets/registration_buttons.dart';
import 'package:tule/ui/widgets/title_row.dart';
import 'package:tule/ui/widgets/user_details_input.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static final id = 'forgot_password_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(
              onPressed: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 40.0,
                top: 20.0,
                right: 25.0,
              ),
              child: Column(
                children: [
                  TitileRowWidget(
                    title: 'Forgot password',
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Please enter your email to receive a password reset link via email ',
                      style: TextStyle(color: Colors.black26, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  DetailsInputWidget(
                    hintText: 'Email',
                    onChanged: (value) {
                      print('$value from Email');
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RegistrationButton(
                    buttonText: 'Send',
                    onPressed: () {},
                    padding: 0.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
