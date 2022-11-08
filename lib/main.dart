import 'package:flutter/material.dart';
import 'homepage.dart';
import './routes/register.dart';

void main() {
  runApp(MaterialApp(routes: {
    '/register': (context) => const Register(),
    '/homepage': (context) => const Homepage()
  }, home: Homepage()));
}
