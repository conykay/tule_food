import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tule/screens/login_screen.dart';
import 'package:tule/screens/open_kitchen_screen.dart';

var _auth = FirebaseAuth.instance;

class PersistScaffold extends StatelessWidget {
  const PersistScaffold({Key key, this.body}) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.kitchen,
                color: Colors.deepOrange.withOpacity(0.7),
              ),
              title: Text(
                'Open Kitchen',
                style: TextStyle(fontSize: 20.0, color: Colors.black45),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushNamed(context, OpenKitchenScreen.id);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.directions_run,
                color: Colors.deepOrange.withOpacity(0.7),
              ),
              title: Text(
                'Log out',
                style: TextStyle(fontSize: 20.0, color: Colors.black45),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, LogInScreen.id);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(),
      body: body,
    );
  }
}
