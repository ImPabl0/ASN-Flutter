import 'dart:ui';

import 'package:asn_flutter/homepage.dart';
import 'package:asn_flutter/services/client.dart';
import 'package:asn_flutter/services/emailvalidator.dart';
import 'package:asn_flutter/services/loading.dart';
import 'package:asn_flutter/services/validateForm.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../styles/buttonstyles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final cpf = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final rsenha = TextEditingController();
  final FocusNode nomeFocus = FocusNode();
  final FocusNode sobrenomeFocus = FocusNode();
  final FocusNode cpfFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode senhaFocus = FocusNode();
  final FocusNode rsenhaFocus = FocusNode();
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void dispose() {
    nome.dispose;
    sobrenome.dispose;
    cpf.dispose;
    email.dispose;
    senha.dispose;
    rsenha.dispose;
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  final _Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: SizedBox(
            width: 270,
            height: 680,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // ignore: prefer_const_constructors
                        Text(
                          'ASN',
                          style: const TextStyle(
                              fontFamily: 'ASN',
                              fontSize: 60,
                              color: Color(0xFF005983)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Soft',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF1A738)),
                            ),
                            const Text(
                              'ware',
                              style: TextStyle(color: Color(0xFFF1A738)),
                            )
                          ],
                        ),
                        Form(
                            key: _Formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: true,
                                  onFieldSubmitted: _fieldFocusChange(
                                      context, nomeFocus, sobrenomeFocus),
                                  focusNode: nomeFocus,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo é obrigatório.';
                                    }
                                    return null;
                                  },
                                  controller: nome,
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                      label: Text('NOME'),
                                      hoverColor: Colors.grey),
                                ),
                                TextFormField(
                                  onFieldSubmitted: _fieldFocusChange(
                                      context, sobrenomeFocus, cpfFocus),
                                  focusNode: sobrenomeFocus,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo é obrigatório.';
                                    }
                                    return null;
                                  },
                                  controller: sobrenome,
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                      label: Text('SOBRENOME'),
                                      hoverColor: Colors.grey),
                                ),
                                TextFormField(
                                  onFieldSubmitted: _fieldFocusChange(
                                      context, cpfFocus, emailFocus),
                                  focusNode: cpfFocus,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo é obrigatório.';
                                    } else if (!CPFValidator.isValid(value)) {
                                      return 'CPF incorreto.';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: cpf,
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                      label: Text('CPF'),
                                      hoverColor: Colors.grey),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    CpfInputFormatter()
                                  ],
                                ),
                                TextFormField(
                                  onFieldSubmitted: _fieldFocusChange(
                                      context, emailFocus, senhaFocus),
                                  focusNode: emailFocus,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo é obrigatório.';
                                    } else if (!isValidEmail(value)) {
                                      return 'Email inválido';
                                    }
                                    return null;
                                  },
                                  controller: email,
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                      label: Text('E-MAIL'),
                                      hoverColor: Colors.grey),
                                ),
                                TextFormField(
                                  onFieldSubmitted: _fieldFocusChange(
                                      context, senhaFocus, rsenhaFocus),
                                  focusNode: senhaFocus,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo é obrigatório.';
                                    } else if (value != rsenha.text) {
                                      return 'As senhas não coincidem.';
                                    } else if (value.length < 6) {
                                      return 'Sua senha precisa ter pelo menos 6 digitos';
                                    }
                                    return null;
                                  },
                                  controller: senha,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    label: Text('SENHA'),
                                  ),
                                ),
                                TextFormField(
                                  autofocus: false,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    if (login(
                                            _Formkey,
                                            context,
                                            cpf.text,
                                            email.text,
                                            nome.text,
                                            senha.text,
                                            sobrenome.text) ==
                                        0) {
                                      Get.off(Homepage());
                                    }
                                  },
                                  focusNode: rsenhaFocus,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Este campo é obrigatório.';
                                    } else if (value != senha.text) {
                                      return 'As senhas não coincidem.';
                                    }
                                    return null;
                                  },
                                  controller: rsenha,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    label: Text('REPETIR SENHA'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Button(
                                    text: 'CADASTRE-SE!',
                                    color: const Color(0xFFDDC90F),
                                    onPressed: () async {
                                      Loading(context);
                                      await login(
                                          _Formkey,
                                          context,
                                          cpf.text,
                                          email.text,
                                          nome.text,
                                          senha.text,
                                          sobrenome.text);
                                      Navigator.pop(context);
                                    },
                                    radius: 20)
                              ],
                            ))
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
