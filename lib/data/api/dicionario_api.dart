import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DicionarioAPI{

  Future<String> buscarSignificado({required String palavra}) async{

    String baseURL = "api.dictionaryapi.dev";
    Uri url = Uri.http(baseURL, "/api/v2/entries/en/$palavra");
    Response response = await http.get(url);

    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      String significado = json[0]['meanings'][0]['definitions'][0]['definition'];
      return significado;
    } else {
      return "Nao achamos o significado da palavra $palavra";
    }
  }
}
