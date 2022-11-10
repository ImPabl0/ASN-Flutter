# ASN Software
Um aplicativo simples feito para o cadastro de clientes no banco de dados MySQL através de uma [API feita em Java](https://github.com/ImPabl0/API-Java).

## Pré-requisitos
 Flutter SDK, Android Studio ou outra IDE de sua preferência

## Funcionalidades

 - Validação de todos os campos de registro dando ênfase em campos como número de CPF e quantidade de caracteres na senha.
 - Tratamento de erros como falhas internas da API, falha de conexão e já existência dos campos ``CPF`` e ``E-mail`` dentro da database.
## Observações
 
 - O botão ``Login`` é meramente ilustrativo, apenas para dar contexto a função do aplicativo.
 - O endereço da api está setado para ``http://192.168.0.102:8080`` e pode ser alterado no arquivo ``/lib/services/client.dart``
 
## Referência

 - [Documentação package GET](https://pub.dev/documentation/get/latest/)
 - [Documentação package DIO](https://pub.dev/documentation/dio/latest/)
 - [Forms com validação](https://docs.flutter.dev/cookbook/forms/validation)

## Dependências externas utilizadas

 - [Dio, para conexão Http](https://pub.dev/packages/dio)
 - [Brasil fields, para validação de formulários com dados brasileiros (como o CPF)](https://pub.dev/packages/brasil_fields)
 - [Get, para simplificação de Snackbars e navegação entre páginas](https://pub.dev/packages/get)

## Autor
[Pablo](https://github.com/ImPabl0)
