import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle kTitleStyle() {
  return TextStyle(
      fontWeight: FontWeight.w400, fontSize: 35.0, color: Colors.white);
}

TextStyle kTempStyle() {
  return TextStyle(
      fontWeight: FontWeight.w600, fontSize: 50, color: Colors.white);
}

TextStyle kTextStyle() {
  return TextStyle(
      fontWeight: FontWeight.w800, fontSize: 70, color: Colors.white);
}

const kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city,
      color: Colors.white,),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0),),
        borderSide: BorderSide.none
    )

);


