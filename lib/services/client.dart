import 'package:dio/dio.dart';

class Client {
  final String nome;
  final String sobrenome;
  final String cpf;
  final String email;
  final String senha;
  Client(
      {required this.nome,
      required this.cpf,
      required this.sobrenome,
      required this.email,
      required this.senha});

  register() async {
    var dio = Dio();
    dio.options.connectTimeout = 2000;
    var post = {
      "nome": nome,
      "sobrenome": sobrenome,
      "cpf": cpf,
      "email": email,
      "senha": senha
    };
    try {
      Response response = await dio.post('http://192.168.0.102:8080/register',
          data: post, options: Options(validateStatus: ((status) {
        if (status == null) {
          return false;
        }
        if (status == 409 || status == 408) {
          return true;
        } else {
          return status >= 200 && status < 300;
        }
      })));
      if (response.statusCode == 409) {
        return 1;
      } else if (response.statusCode == 200) {
        return 0;
      }
    } on DioError catch (ex) {
      return ex;
    }
  }
}
