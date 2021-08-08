import 'package:flutter/material.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/location.dart';
import 'package:weather/pages/loadingscreen.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: '/home',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => Location()
    },
  ));
}