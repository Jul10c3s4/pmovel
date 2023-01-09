import 'package:http/http.dart' as http;

class Location{
  final String baseUrl = "locationapi.fhyvugvfjudgf.repl.co";

  Future<void> insertCountry({required String country, required String state, required String city, required String neighborhood, required String street, required String cep, required String number}) async {
    Uri url = Uri.http(baseUrl, "/insertAdress/$country/$state/$city/$cep/$neighborhood/$street/$number");
    http.Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);
  }
}