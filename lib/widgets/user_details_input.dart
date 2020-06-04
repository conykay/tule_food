import 'package:flutter/material.dart';

class DetailsInputWidget extends StatelessWidget {
  DetailsInputWidget({
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.initValue,
    this.controller,
  });
  final Function onChanged;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final String initValue;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'please enter $hintText';
          }
          return null;
        },
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        initialValue: initValue,
        cursorColor: Colors.amber,
        style: TextStyle(
          height: 1.5,
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: prefixIcon,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                style: BorderStyle.none,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                style: BorderStyle.solid,
              )),
          hintStyle: TextStyle(color: Colors.black26),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.orangeAccent,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                style: BorderStyle.none,
              )),
          filled: true,
        ),
      ),
    );
  }
}
