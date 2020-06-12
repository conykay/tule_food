import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tule/core/models/menu_item_model.dart';
import 'package:tule/core/viewmodels/menu_item_model_CRUD.dart';
import 'package:tule/ui/widgets/image_picker.dart';
import 'package:tule/ui/widgets/registration_buttons.dart';
import 'package:tule/ui/widgets/user_details_input.dart';

class AddMenuItemScreen extends StatefulWidget {
  @override
  _AddMenuItemScreenState createState() => _AddMenuItemScreenState();
}

class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
  String name;

  String price;

  String prepTime;

  String foodImgUrl;

  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Enter new menu item',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            ImagePickerWidget(
              image: _image,
              onPress: getImage,
            ),
            DetailsInputWidget(
              hintText: 'Item name',
              onChanged: (value) => name = value,
            ),
            DetailsInputWidget(
              hintText: 'Price',
              onChanged: (value) => price = value,
            ),
            DetailsInputWidget(
              hintText: 'Prep time in minutes',
              onChanged: (value) => prepTime = value,
            ),
            SizedBox(
              height: 20.0,
            ),
            RegistrationButton(
              buttonText: 'Add',
              onPressed: () {
                MenuItemModel item = MenuItemModel(
                    name: name,
                    foodImgUrl: null,
                    image: _image,
                    price: price,
                    prepTime: prepTime);
                context.read<MenuItemModelCRUD>().addItem(item);
//                Navigator.pop(context);
              },
              padding: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
