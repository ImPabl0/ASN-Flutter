import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/buttonstyles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/lowpoly.png'),
                    fit: BoxFit.cover)),
            child: Center(
              child: SizedBox(
                width: 270,
                height: 550,
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
                        // ignore: prefer_const_constructors
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
                              label: Text('NOME'), hoverColor: Colors.grey),
                        ),
                        TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              label: Text('SOBRENOME'),
                              hoverColor: Colors.grey),
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
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              label: Text('E-MAIL'), hoverColor: Colors.grey),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text('SENHA'),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text('REPETIR SENHA'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Button(
                            text: 'CADASTRE-SE!',
                            color: Color(0xFFDDC90F),
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            radius: 20)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
