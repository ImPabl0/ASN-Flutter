import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homepage.dart';
import './routes/register.dart';

void main() {
  runApp(GetMaterialApp(
      title: 'ASN Software',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
      getPages: [
        GetPage(
          name: '/register',
          page: (() => Register()),
          transition: Transition.cupertino,
        )
      ],
      home: const Homepage()));
}
