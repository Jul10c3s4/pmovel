import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CEPAdress {

  final String baseUrl = "viacep.com.br";

  Future<dynamic>getAdress({required int cep}) async {

    Uri url = Uri.http(baseUrl, "/ws/$cep/json/");
    Response response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    var json = jsonDecode(response.body);

    return json;
  }

  void setFormControllers({required dynamic json,required TextEditingController cityController, required TextEditingController neighborhoodController, required TextEditingController stateController, required TextEditingController streetController}){
    if (json['cep'] != null) {
      stateController.text = json['uf'];
      cityController.text = json['localidade'];
      neighborhoodController.text = json['bairro'];
      streetController.text = json['logradouro'];
    }
  }

}