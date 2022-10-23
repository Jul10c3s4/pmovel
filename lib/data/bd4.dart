import 'package:app/domain/atributos_card.dart';

class BD {
  static List<Atributos> lista = [
    Atributos(
    titulo: 'MEU PRIMEIRO TESTE',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto...',
    materia: 'PORTUGUÊS',
  ),
   Atributos(
    titulo: 'Conjunções subordinadas',
    descricao: 'As conjunções subordinativas são termos que ligam duas orações sintaticamente dependentes, ou seja, são palavras invariáveis,cuja a função é unir orações,sendo que uma das orações irá exercer o papel de principal e a outra de subordinada(dependente da primeira para o seu sentido ser completo...',
    materia: 'Portugues',
  ),
    Atributos(
    titulo: 'Linguagem HTML',
    descricao: 'HTML é o componente base da web. Isso quer dizer que ele permite a construção de websites e a inserção de novos conteúdos, como imagens e vídeos, por meio dos hipertextos...',
    materia: 'LÓGICA DE PROGRAMAÇÃO',
  ),
    Atributos(
    titulo: 'Formatação de Texto',
    descricao: 'segundo a norma ABNT, os textos devem estar em formato justificado, na fonte Arial ou Times New Romans tamanho 10 ou 12, com espaçamento de 1,5 entre as linhas...',
    materia: 'Português',
  ),
  ];

  static Future<List<Atributos>> getAtributos() async {
    print("ANTES");
    await Future.delayed(const Duration(seconds: 10));
    print("DEPOIS");
    return lista;
  }

}
