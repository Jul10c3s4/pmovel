import 'dart:convert';

import 'package:app/domain/cartao_resumo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CartaoApi {
  String baseUrl =
      "api-memstudy.onrender.com" /*"tourist-packages.herokuapp.com"*/;

  Future<List<CartaoResumo>> listarCartoes() async {
    Uri url = Uri.http(baseUrl, "/admin");
    Response response = await http.get(url);

    List<CartaoResumo> lista = <CartaoResumo>[];
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      for (var json in result) {
        CartaoResumo pacote = CartaoResumo.fromApiJson(json);
        lista.add(pacote);
      }
    }

    return lista;
  }
}
