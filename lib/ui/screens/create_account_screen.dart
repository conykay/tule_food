import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tule/core/models/user_model.dart';
import 'package:tule/core/viewmodels/user_model_CRUD.dart';
import 'package:tule/locator.dart';
import 'package:tule/ui/widgets/alert_dialog.dart';
import 'package:tule/ui/widgets/back_button.dart';
import 'package:tule/ui/widgets/bottom_info.dart';
import 'package:tule/ui/widgets/registration_buttons.dart';
import 'package:tule/ui/widgets/title_row.dart';
import 'package:tule/ui/widgets/user_details_input.dart';

import 'login_screen.dart';

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

  void _createUser(UserModelCRUD model) async {
    BuildContext dialogContext = context;

    showDialog(
        context: dialogContext,
        builder: (_) => TuleAlertDialog(
              title: 'Getting things set up ...',
              widget: CircularProgressIndicator(
                backgroundColor: Colors.deepOrangeAccent,
              ),
            ));

    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        _user = await _auth.currentUser();
        UserModel data = UserModel(_user.uid,
            email: _user.email, name: username, kitchen: false, Kid: null);
        await model.addUserModel(data);
        Navigator.pushNamed(context, LogInScreen.id);
      }
    } catch (e) {
      debugPrint(e.toString());
      var user = await _auth.currentUser();
      user.delete();
      Navigator.pop(dialogContext);
      showDialog(
          context: dialogContext,
          builder: (_) => TuleAlertDialog(
                title: 'Failed',
                widget: Text('retry process'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<UserModelCRUD>(),
        child: Scaffold(
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
                          title: 'Create account',
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
                        Consumer<UserModelCRUD>(
                            builder: (context, model, child) {
                          return RegistrationButton(
                            buttonText: 'Sign up',
                            onPressed: () {
                              if (EmailValidator.validate(email)) {
                                if (_formKey.currentState.validate()) {
                                  _createUser(model);
                                }
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => TuleAlertDialog(
                                          title: 'Invalid Email $email',
                                          widget: Text(
                                              'enter valid email and try again'),
                                        ));
                              }
                            },
                            padding: 0.0,
                          );
                        }),
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
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => LogInScreen(),
                                transitionDuration: Duration(seconds: 1),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
