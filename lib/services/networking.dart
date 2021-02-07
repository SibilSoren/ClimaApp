import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:ClimaApp/screens/loading_screen.dart';

class Networking {

  Networking(this.url);

  final String url;


  void getData()async{
    Response responseData = await get(url);

    if(responseData.statusCode == 200){
      String data = responseData.body;

      var parsedData = jsonDecode(data);
      return parsedData;

    }else{
      print(responseData.statusCode);
    }
  }
}