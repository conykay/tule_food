import 'package:flutter/material.dart';
import 'package:tule/screens/add_menu_item_screen.dart';
import 'package:tule/services/location_service.dart';
import 'package:tule/widgets/persist_scaffold.dart';
import 'package:tule/widgets/registration_buttons.dart';
import 'package:tule/widgets/title_row.dart';
import 'package:tule/widgets/user_details_input.dart';

class OpenKitchenScreen extends StatefulWidget {
  static final id = 'open_kitchen';
  @override
  _OpenKitchenScreenState createState() => _OpenKitchenScreenState();
}

class _OpenKitchenScreenState extends State<OpenKitchenScreen> {
  final _formKey = GlobalKey<FormState>();
  String kitchenName;
  String kitchenLocation;
  TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistScaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              TitileRowWidget(
                title: 'Karibu Jikoni :)',
              ),
              DetailsInputWidget(
                hintText: 'Kitchen name',
                onChanged: (value) => kitchenName = value,
              ),
              DetailsInputWidget(
                hintText: 'Location of operation',
                prefixIcon: FlatButton(
                  splashColor: Colors.orangeAccent,
                  onPressed: () async {
                    kitchenLocation =
                        await LocationService().getExactLocation();
                    setState(() {
                      _controller.text = kitchenLocation;
                    });
                  },
                  child: Text(
                    'get current',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                controller: _controller,
              ),
              DetailsInputWidget(
                hintText: 'Description',
              ),
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: 'next',
                child: RegistrationButton(
                  buttonText: 'Next',
                  onPressed: () {
                    //todo:form validation
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => AddMenuItems(),
                        transitionDuration: Duration(seconds: 1),
                      ),
                    );
                  },
                  padding: 0.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
