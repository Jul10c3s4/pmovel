import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CountryNames{

  Future<List<String>> getCountriesName() async {
    List<String> countries = <String>[];
    String baseUrl = "servicodados.ibge.gov.br";
    Uri url = Uri.http(baseUrl, "/api/v1/localidades/paises");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var i = 0; i < json.length; i++) {
        countries.add(json[i]['nome']);
      }
    }

    return countries;
  }
}