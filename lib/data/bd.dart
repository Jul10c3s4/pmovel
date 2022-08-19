import '../domain/cartaoDefinitivo.dart';
import 'dart:math';

class BD {
  /*
  static List<Atributos> cardDatabase = [
    Atributos("card1", "textoCard1"),
    Atributos("card2", "textoCard2"),
    Atributos("card3", "textoCard3"),
    Atributos("card4", "textoCard4"),
  ];
  */

  static List<CardDef> cardDatabase = [
    CardDef(titulo: "card1", descricao: "textoCard1"),
    CardDef(titulo: "card2", descricao: "textoCard2"),
    CardDef(titulo: "card3", descricao: "textoCard3", image: "url"),
    CardDef(titulo: "card4", descricao: "textoCard4", video: "url"),
    CardDef(titulo: "card5", descricao: "textoCard5", questao: "questao1 ..."),
    CardDef(titulo: "card6", descricao: "textoCard6"),
    CardDef(titulo: "card7", descricao: "textoCard7"),
    CardDef(titulo: "card8", descricao: "textoCard8"),
    CardDef(titulo: "card9", descricao: "textoCard9"),
    CardDef(titulo: "card10", descricao: "textoCard10"),
    CardDef(titulo: "card11", descricao: "textoCard11"),
    CardDef(titulo: "card12", descricao: "textoCard12"),
  ];

  static addCard(CardDef novoCard) {
    BD.cardDatabase.insert((cardDatabase.length - 1), novoCard);
  }

  //recebe o indice do Card que será deletado
  static deletarCard(int index) {
    BD.cardDatabase.removeAt(index);
  }

  static sortearCard() {
    Random rnd = new Random();
    int indiceSorteado = rnd.nextInt(cardDatabase.length - 1);
    return cardDatabase[indiceSorteado];
  }
}
