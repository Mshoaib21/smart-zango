import 'package:api_project/fourth_example.dart';
import 'package:api_project/home_screen.dart';
import 'package:api_project/second_example.dart';
import 'package:api_project/signup.dart';
import 'package:api_project/third_example.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' ;

import 'image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickerScreen(),
    );
  }
}

