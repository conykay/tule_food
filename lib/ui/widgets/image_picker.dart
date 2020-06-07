import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    Key key,
    @required File image,
    this.onPress,
  })  : _image = image,
        super(key: key);

  final File _image;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: _image == null
                    ? null
                    : DecorationImage(
                        image: FileImage(_image),
                        fit: BoxFit.fill,
                      ),
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            _image == null
                ? Icon(
                    Icons.add_a_photo,
                    color: Colors.orangeAccent.withOpacity(0.5),
                    size: 50.0,
                  )
                : SizedBox(),
            _image == null
                ? Text(
                    'click here to add image',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
