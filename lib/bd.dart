import '../domain/atributos_card.dart';
//import '../domain/atributos_conteudos_geometrias.dart';
//import '../domain/card_resumo.dart';
import '../domain/cartaoDefinitivo.dart';

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
    CardDef(titulo: "card2", descricao: "textoCard2"),
    CardDef(titulo: "card2", descricao: "textoCard2"),
    CardDef(titulo: "card2", descricao: "textoCard2"),
    CardDef(titulo: "card2", descricao: "textoCard2"),
  ];

  static addCard(CardDef novoCard) {
    BD.cardDatabase.insert((cardDatabase.length - 1), novoCard);
  }

  //recebe o indice do Card que será deletado
  static deletarCard(int index) {
    BD.cardDatabase.removeAt(index);
  }
}
