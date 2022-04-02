// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bloc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [
        
      ],
    );
  }
}

