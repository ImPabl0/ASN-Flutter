// ignore_for_file: prefer_const_constructors
import 'package:flutter/services.dart';
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
            image: DecorationImage(
                image: AssetImage('assets/images/lowpoly.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: SizedBox(
            width: 270,
            height: 370,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'ASN',
                      style: TextStyle(fontFamily: 'ASN', fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Soft',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('ware')
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
    );
  }
}
