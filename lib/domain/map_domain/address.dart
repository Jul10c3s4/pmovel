class Adress{

  late String cep;
  late String logradouro;
  late String complemento;
  late String bairro;
  late String localidade;
  late String uf;
  late String ddd;

  Adress.fromJson(Map<String, dynamic> json){
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ddd = json['ddd'];
  }

}