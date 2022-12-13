import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:http/http.dart';

class FHCP_API{
    static final String _baseUrl = "http://127.0.0.1:3000";

    static Future<List<List<CardHalf>>> findAllCards() async {
        Uri url = Uri.http(_baseUrl, "/cards/");
        Response response = await http.get(url);
        
        List<CardHalf> listaB = <CardHalf>[];
        List<CardHalf> listaH1 = <CardHalf>[];
        List<CardHalf> listaH2 = <CardHalf>[];
        List<CardHalf> listaTrash = <CardHalf>[];

        if(response.statusCode == 200){
            var result = jsonDecode(response.body);
            //print("result");

            for(json in result){
                if(json["cardField"] == "deck"){
                    Cardhalf c = CardHalf.fromJson(json);
                    listaB.add(c);
                }else if(json["cardField"] == "hand"){
                    Cardhalf c = CardHalf.fromJson(json);
                    listaH1.add(c);
                }else if(json["cardField"] == "trash"){
                    Cardhalf c = CardHalf.fromJson(json);
                    listaTrash.add(c);
                } 
            }
            
        }

        return [listaB, listaH1, listaTrash];
    }


    Future<void> uploadCards(List<CardHalf> deck, List<CardHalf> hand1, List<CardHalf> trash) async {
        Uri url = Uri.http(_baseUrl, "/cards/create");

        String cardField = "deck";
        for(cardH in deck){
            var cJson = cardH.toJson();


            var response = await http.post(url, body: {'text': cJson['text'], 'isFaceUp': true, 'cardField': cardField});

            if(response.statusCode == 201){
                print("card criado com sucesso");
            }
        }

        String cardField = "hand";
        //(...)
        String cardField = "trash";
        //(...)



    }
}