import 'dart:convert';

import 'package:app/domain/half_card.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FhcAPI {
  final String _baseUrl = "...";

  Future<List<CardHalf>> findAllCards() async {
    Uri url = Uri.http(_baseUrl, "/router/");
    Response response = await http.get(url);

    List<CardHalf> lista = <CardHalf>[];
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      for (var json in result) {
        CardHalf c = CardHalf.fromJson(json);
        lista.add(c);
      }
    }

    return lista;
  }
}
