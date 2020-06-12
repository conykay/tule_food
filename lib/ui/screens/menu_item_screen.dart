import 'package:cloud_firestore_platform_interface/src/geo_point.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tule/core/models/kitchen_model.dart';
import 'package:tule/core/models/menu_item_model.dart';
import 'package:tule/core/models/user_model.dart';
import 'package:tule/core/viewmodels/kitchen_model_CRUD.dart';
import 'package:tule/core/viewmodels/menu_item_model_CRUD.dart';
import 'package:tule/core/viewmodels/user_model_CRUD.dart';
import 'package:tule/ui/screens/add_menu_item_screen.dart';
import 'package:tule/ui/widgets/alert_dialog.dart';
import 'package:tule/ui/widgets/title_row.dart';

class AddMenuItems extends StatefulWidget {
  static get id => 'add_menu_item';

  final String kitchenName;
  final String description;
  final String kitchenLocation;
  final GeoPoint geoPointLocation;

  AddMenuItems(this.kitchenName, this.kitchenLocation, this.geoPointLocation,
      this.description);

  @override
  _AddMenuItemsState createState() => _AddMenuItemsState();
}

class _AddMenuItemsState extends State<AddMenuItems> {
  List<MenuItemModel> _items;
  int menuSize;

  _createKitchen() async {
    showDialog(
        context: context,
        builder: (_) => TuleAlertDialog(
              title: 'Getting your kitchen ready ...',
              widget: CircularProgressIndicator(
                backgroundColor: Colors.orange[900],
              ),
            ));
    FirebaseUser _uid = await FirebaseAuth.instance.currentUser();
    KitchenModel newModel = KitchenModel(
      kid: _uid.uid,
      kitchenLocation: widget.kitchenLocation,
      kitchenName: widget.kitchenName,
      description: widget.description,
      geoPointLocation: widget.geoPointLocation,
    );

    try {
      await context.read<KitchenModelCRUD>().addKitchen(newModel, _uid.uid);
      await context.read<MenuItemModelCRUD>().addMenuItems(_items);
      await context
          .read<UserModelCRUD>()
          .editUserModel(UserModel(_uid.uid,
              name: _uid.displayName,
              email: _uid.email,
              kitchen: true,
              Kid: _uid.uid))
          .then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      Navigator.pop(context);
      print('failed $e');
    }
  }

  @override
  void initState() {
    _items = context.read<MenuItemModelCRUD>().menu;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => TuleAlertDialog(
                          title: 'Confirm',
                          widget: Text(
                              'The menu items will be added to your store menu.'),
                          actions: [
                            GestureDetector(
                                onTap: () {
                                  _createKitchen();
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(fontSize: 20.0),
                                )),
                            GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 20.0),
                                ))
                          ],
                        ));
              }),
        ],
      ),
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
                fontSize: 25.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: ListView.builder(
                    itemCount: context.watch<MenuItemModelCRUD>().menuSize,
                    itemBuilder: (context, position) {
                      MenuItemModel item = _items[position];
                      return Card(
                        elevation: 7.0,
                        shadowColor: Colors.grey.withOpacity(0.3),
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: item.image != null
                                          ? DecorationImage(
                                              image: FileImage(item.image),
                                              fit: BoxFit.fill)
                                          : null),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 40.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    color: Colors.black54),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                                color: Colors.greenAccent,
                                                borderRadius:
                                                    BorderRadius.circular(7.0)),
                                            child: Text(
                                              item.price,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      color: Colors.green[800]),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                                color: Colors.orangeAccent[100],
                                                borderRadius:
                                                    BorderRadius.circular(7.0)),
                                            child: Text(
                                              '${item.prepTime} min',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      color:
                                                          Colors.orange[800]),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 170,
                                      bottom: 45,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.mode_edit,
                                          size: 30,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Positioned(
                                      left: 170,
                                      top: 60,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete_forever,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => TuleAlertDialog(
                                                    title:
                                                        'Delete ${_items[position].name} from menu ?',
                                                    actions: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  MenuItemModelCRUD>()
                                                              .removeItem(_items[
                                                                  position]);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Delete'),
                                                      )
                                                    ],
                                                  ));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddMenuItemScreen(),
              ),
            ),
            isScrollControlled: true,
          );
        },
      ),
    );
  }
}
