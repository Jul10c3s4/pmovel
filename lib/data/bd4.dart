import 'package:app/domain/atributos_card.dart';

class BD {
  static List<Atributos> lista = [
    Atributos(
    titulo: 'MEU PRIMEIRO CARD',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  ),
   Atributos(
    titulo: 'Aprenda Linguagem Dart',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  ),
    Atributos(
    titulo: 'Aprenda Linguagem HTML',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  ),
    Atributos(
    titulo: 'Formatação de Texto',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  ),
  ];

  static Future<List<Atributos>> getAtributos() async {
    print("ANTES");
    await Future.delayed(const Duration(seconds: 10));
    print("DEPOIS");
    return lista;
  }

}
