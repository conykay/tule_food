import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tule/core/models/menu_item_model.dart';
import 'package:tule/core/viewmodels/menu_item_model_CRUD.dart';
import 'package:tule/ui/screens/add_menu_item_screen.dart';
import 'package:tule/ui/widgets/title_row.dart';

class AddMenuItems extends StatefulWidget {
  static final id = 'add_menu_item';
  @override
  _AddMenuItemsState createState() => _AddMenuItemsState();
}

class _AddMenuItemsState extends State<AddMenuItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                print('done');
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
                  child: ListView.builder(
                    itemCount: context.watch<MenuItemModelCRUD>().menuSize,
                    itemBuilder: (context, position) {
                      MenuItemModel item =
                          context.read<MenuItemModelCRUD>().menu[position];
                      print('this is the url${item.foodImgUrl}');
                      return Card(
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: item.foodImgUrl != null
                                          ? DecorationImage(
                                              image: FileImage(item.foodImgUrl),
                                              fit: BoxFit.fill)
                                          : null),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        item.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Text(
                                        item.prepTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        item.price,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      )
                                    ],
                                  ))
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
