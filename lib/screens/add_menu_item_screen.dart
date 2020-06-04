import 'package:flutter/material.dart';
import 'package:tule/widgets/title_row.dart';

class AddMenuItems extends StatefulWidget {
  static final id = 'add_menu_item_screen';
  @override
  _AddMenuItemsState createState() => _AddMenuItemsState();
}

class _AddMenuItemsState extends State<AddMenuItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              TitileRowWidget(
                title: 'Add menu Items',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'next',
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
        onPressed: () {
          //todo:add menu items on click
        },
      ),
    );
  }
}
