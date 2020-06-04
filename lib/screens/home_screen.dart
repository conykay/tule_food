import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tule/widgets/persist_scaffold.dart';

class HomeScreen extends StatefulWidget {
  static final id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistScaffold();
  }
}
