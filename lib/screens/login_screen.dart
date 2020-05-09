import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tule/constants.dart';
import 'package:tule/screens/create_account_screen.dart';
import 'package:tule/screens/forgot_password_screen.dart';
import 'package:tule/widgets/back_button.dart';
import 'package:tule/widgets/bottom_info.dart';
import 'package:tule/widgets/registration_buttons.dart';
import 'package:tule/widgets/title_row.dart';
import 'package:tule/widgets/user_details_input.dart';

class LogInScreen extends StatefulWidget {
  static final id = 'login_screen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  void _loginUser() async {
    try {
      var loginUser = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (loginUser != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
            (Route<dynamic> route) => false);
      }
    } catch (e) {
      debugPrint(e);
    }
  }

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
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(
                  left: 40.0,
                  top: 20.0,
                  right: 25.0,
                ),
                child: Column(
                  children: [
                    TitileRowWidget(
                      title: 'Log in account',
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    DetailsInputWidget(
                      hintText: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    DetailsInputWidget(
                      hintText: 'password',
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      prefixIcon: FlatButton(
                        splashColor: Colors.orangeAccent,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ForgotPasswordScreen.id,
                          );
                        },
                        child: Text(
                          'Forgot?',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RegistrationButton(
                      buttonText: 'Log In',
                      onPressed: () {
                        if (EmailValidator.validate(email)) {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              kGetProgress(context, '', false).show();
                            });
                            _loginUser();
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Invalid email $email'),
                                  content: Text('Enter valid email'),
                                  elevation: 24.0,
                                );
                              });
                        }
                      },
                      padding: 0.0,
                    ),
                    SizedBox(
                      height: 200.0,
                    ),
                    BottomInfoWidget(
                      leading: 'Dont have an account ?',
                      buttonText: 'Sign up',
                      buttonAction: () =>
                          Navigator.pushNamed(context, CreateAccountScreen.id),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
