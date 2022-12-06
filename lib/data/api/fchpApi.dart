class FHCP_API{
    final String _baseUrl = "...";

    Future<List<CardHalf>> findAllCards(){
        Uri url = Uri.http(_baseUrl, "/router/");
        Response response = await http.get(url);

        
        
        List<CardHalf> lista = <CardHalf>[];

        if(response.statusCode == 200){
            var result = jsonDecode(response.body);

            for(json in result){
                Cardhalf c = CardHalf.fromJson(json);
                lista.add(c);
            }
            
        }

        return lista;


    }
}