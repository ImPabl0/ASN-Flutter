// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';

import './styles/buttonstyles.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/images/background1.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: SizedBox(
            width: 270,
            height: 370,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
              ),
              child: ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'ASN',
                          style: TextStyle(
                              fontFamily: 'ASN',
                              fontSize: 60,
                              color: Color(0xFF005983)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Soft',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF1A738)),
                            ),
                            Text(
                              'ware',
                              style: TextStyle(color: Color(0xFFF1A738)),
                            )
                          ],
                        ),
                        TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              label: Text('CPF'), hoverColor: Colors.grey),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ],
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text('SENHA'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Button(
                            text: "LOGIN",
                            color: Colors.blue,
                            onPressed: () {},
                            radius: 20),
                        Button(
                            text: 'CADASTRE-SE!',
                            color: Color(0xFFDDC90F),
                            onPressed: (() => Get.toNamed('/register')),
                            radius: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
