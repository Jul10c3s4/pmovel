import 'dart:convert';

import 'package:app/domain/half_card.dart';
import 'package:http/http.dart' as http;
//import 'package:aula_913/domain/pacote_turistico.dart';
//import 'package:http/http.dart';
import '../../domain/half_card.dart';

class FHCP_API {
  static final String _baseUrl = "http://127.0.0.1:3000";

  static Future<List<List<CardHalf>>> findAllCards() async {
    Uri url = Uri.http(_baseUrl, "/cards/");
    var response = await http.get(url);

    List<CardHalf> listaB = <CardHalf>[];
    List<CardHalf> listaH1 = <CardHalf>[];
    List<CardHalf> listaH2 = <CardHalf>[];
    List<CardHalf> listaTrash = <CardHalf>[];

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      //print("result");

      for (var json in result) {
        if (json["cardField"] == "deck") {
          CardHalf c = CardHalf.fromJson(json);
          listaB.add(c);
        } else if (json["cardField"] == "hand") {
          CardHalf c = CardHalf.fromJson(json);
          listaH1.add(c);
        } else if (json["cardField"] == "trash") {
          CardHalf c = CardHalf.fromJson(json);
          listaTrash.add(c);
        }
      }
    }

    return [listaB, listaH1, listaTrash];
  }
  //teste

  static Future<void> uploadCards(
      List<CardHalf> deck, List<CardHalf> hand1, List<CardHalf> trash) async {
    String cardField = "deck";
    for (var cardH in deck) {
      var cJson = cardH.toJson();

      Uri url = Uri.http(_baseUrl, "/cards/${cJson['text']}/create");

      var response = await http.post(url, body: {
        'text': cJson['text'],
        'isFaceUp': true,
        'cardField': cardField
      });

      if (response.statusCode == 201) {
        print("card criado com sucesso");
      }
    }

    cardField = "hand";
    for (var cardH in hand1) {
      var cJson = cardH.toJson();

      Uri url = Uri.http(_baseUrl, "/cards/${cJson['text']}/create");

      var response = await http.post(url, body: {
        'text': cJson['text'],
        'isFaceUp': true,
        'cardField': cardField
      });

      if (response.statusCode == 201) {
        print("card criado com sucesso");
      }
    }
    cardField = "trash";
    for (var cardH in trash) {
      var cJson = cardH.toJson();

      Uri url = Uri.http(_baseUrl, "/cards/${cJson['text']}/create");

      var response = await http.post(url, body: {
        'text': cJson['text'],
        'isFaceUp': true,
        'cardField': cardField
      });

      if (response.statusCode == 201) {
        print("card criado com sucesso");
      }
    }
  }

  static Future<void>? dropDatabase() async {
    Uri url = Uri.http(_baseUrl, "/cards/");
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    for (var json in result) {
      Uri url = Uri.http(_baseUrl, "/cards/${json['text']}/delete");
      var response = await http.get(url);
      /*body: {
        "text": json["text"],
        "isFaceUp": true,
        "cardField": json['cardField']
      }*/
    }
  }
  //
}
