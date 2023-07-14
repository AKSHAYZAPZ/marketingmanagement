import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonFuntion{
  static addDataToSharedPreferences(String key,dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print('Data added to SharedPreferences: $key - $value');
  }

  static getSavedKey(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  static getSavedname(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString(name);
    // print(name);
    return username;
  }


  }



