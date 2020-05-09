import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tule/constants.dart';
import 'package:tule/screens/login_screen.dart';
import 'package:tule/widgets/back_button.dart';
import 'package:tule/widgets/bottom_info.dart';
import 'package:tule/widgets/registration_buttons.dart';
import 'package:tule/widgets/title_row.dart';
import 'package:tule/widgets/user_details_input.dart';

final _firestore = Firestore.instance;

class CreateAccountScreen extends StatefulWidget {
  static final id = 'create_account_screen';

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  String email;
  String password;
  String username;
  String phone;
  final _formKey = GlobalKey<FormState>();
  ProgressDialog progress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progress = kGetProgress(context, '', false);
  }

  void _createUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        _user = await _auth.currentUser();
        await _firestore.collection("UserDetails").document(_user.uid).setData({
          'username': username,
          'phonenumber': phone,
        });
        Navigator.pushNamed(context, LogInScreen.id);
      }
    } catch (e) {
      await progress.hide();
      kGetProgress(context, e.toString(), true).show();
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Wrap(
          direction: Axis.horizontal,
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
                      title: 'Create you|r account',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DetailsInputWidget(
                      hintText: 'username',
                      onChanged: (value) {
                        username = value;
                      },
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
                    ),
                    DetailsInputWidget(
                      hintText: 'phone',
                      onChanged: (value) {
                        phone = value.toString();
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RegistrationButton(
                      buttonText: 'Sign up',
                      onPressed: () {
                        if (EmailValidator.validate(email)) {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              progress.show();
                            });
                            _createUser();
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
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Text(
                        'By clicking Sign Up you agree to our Terms and Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BottomInfoWidget(
                      leading: 'Already have an account ?',
                      buttonText: 'Log In',
                      // ignore: unnecessary_statements
                      buttonAction: () {
                        Navigator.pushNamed(context, LogInScreen.id);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
