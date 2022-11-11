import 'package:asn_flutter/routes/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      home: const splashscreen()));
}
