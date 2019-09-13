// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// app imports
import 'package:omio_clone/pages/home.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]).then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));
  });
}