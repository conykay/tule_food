import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tule/core/services/location_service.dart';
import 'package:tule/ui/widgets/persist_scaffold.dart';
import 'package:tule/ui/widgets/registration_buttons.dart';
import 'package:tule/ui/widgets/title_row.dart';
import 'package:tule/ui/widgets/user_details_input.dart';

import 'menu_item_screen.dart';

class OpenKitchenScreen extends StatefulWidget {
  static final id = 'open_kitchen';
  @override
  _OpenKitchenScreenState createState() => _OpenKitchenScreenState();
}

class _OpenKitchenScreenState extends State<OpenKitchenScreen> {
  final _formKey = GlobalKey<FormState>();
  String kitchenName;
  String kitchenLocation;
  GeoPoint geoPointLocation;
  String description;
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _getLocation() async {
    LocationService locationService = LocationService();
    kitchenLocation = await locationService.getExactLocation();
    geoPointLocation = await locationService.getGeoPoint();
    setState(() {
      _controller.text = kitchenLocation;
    });
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
                fontSize: 27.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              DetailsInputWidget(
                hintText: 'Kitchen name',
                onChanged: (value) => kitchenName = value,
              ),
              DetailsInputWidget(
                hintText: 'Location of operation',
                readOnly: true,
                prefixIcon: FlatButton(
                  splashColor: Colors.orangeAccent,
                  onPressed: () async {
                    _getLocation();
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
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please be at the business location before clicking "get current", you can change this later.',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              DetailsInputWidget(
                hintText: 'Description',
                onChanged: (value) => description = value,
              ),
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: 'next',
                child: RegistrationButton(
                  buttonText: 'Next',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => AddMenuItems(kitchenName,
                              kitchenLocation, geoPointLocation, description),
                          transitionDuration: Duration(seconds: 1),
                        ),
                      );
                    }
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
