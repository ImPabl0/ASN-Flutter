import 'package:asn_flutter/homepage.dart';
import 'package:asn_flutter/services/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<int> login(GlobalKey<FormState> Formkey, String cpf, String email,
    String nome, String senha, String sobrenome) async {
  if (Formkey.currentState!.validate()) {
    var registered = await Client(
            cpf: cpf,
            email: email,
            nome: nome,
            senha: senha,
            sobrenome: sobrenome)
        .register();
    switch (registered) {
      case 1:
        Get.snackbar('Ops', 'Este usuário já está cadastrado',
            icon: Icon(Icons.warning),
            backgroundColor: Colors.yellow.withOpacity(0.1));
        break;
      case 2:
        Get.snackbar('Ops', 'Ocorreu um erro, contate o suporte.',
            icon: Icon(Icons.warning),
            backgroundColor: Colors.red.withOpacity(0.1));
        break;
      case 0:
        Get.snackbar('Cadastrado', 'Sua conta foi cadastrada com sucesso',
            icon: Icon(Icons.check),
            backgroundColor: Colors.green.withOpacity(0.1));
        Get.off(() => Homepage());
        break;
      default:
        Get.snackbar('Ops', 'Ocorreu um erro, contate o suporte.',
            icon: Icon(Icons.warning),
            backgroundColor: Colors.red.withOpacity(0.1));
    }
  }
  return 4;
}
