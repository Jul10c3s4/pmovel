import '../domain/cartaoDefinitivo.dart';
import '../data/bd.dart';

class CardHalf {
  final String text;
  final bool isTituloFace;
  bool isFaceUp;
  bool isClear =
      false; //no jogo da memoria diz se o par de cartas já foi encontrado

  CardHalf({
    required this.text,
    required this.isTituloFace,
    this.isFaceUp = false,
  });

  bool equals(CardHalf cardH) {
    CardDef cardResp;
    print("flag0");
    if (this.isTituloFace != cardH.isTituloFace) {
      print("flag1");
      if (this.isTituloFace) {
        print("flag2");
        cardResp = BD.cardDatabase
            .firstWhere((element) => element.titulo == this.text);
      } else {
        print("flag4" + this.text);

        cardResp = BD.cardDatabase.firstWhere(
            (element) => this.text == element.descricao); //problem here :(
      }
      print(cardResp.titulo + " " + cardResp.descricao);
      if (cardResp.titulo == cardH.text || cardResp.descricao == cardH.text) {
        print("são correspondentes");
        return true;
      }
    }
    //print(cardResp.titulo +  cardResp.descricao);
    print("flag9");

    return false;
  }
}
