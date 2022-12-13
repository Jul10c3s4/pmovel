import '../domain/cartaoDefinitivo.dart';
import '../data/bd/bd.dart';

class CardHalf {
  late String text;
  late bool isTituloFace;
  late bool isFaceUp;
  bool isClear =
      false; //no jogo da memoria diz se o par de cartas já foi encontrado

  bool isSelected = false;
  //no showSelectionCardHDialog(), a variável bool isSelected indica se o usuário
  // selecionou a carta na janela mostrada

  CardHalf({
    required this.text,
    required this.isTituloFace,
    this.isFaceUp = false,
  });

  bool equals(CardHalf cardH) {
    CardDef cardResp;

    if (this.isTituloFace != cardH.isTituloFace) {
      if (this.isTituloFace) {
        cardResp = BD.cardDatabase
            .firstWhere((element) => element.titulo == this.text);
      } else {
        cardResp = BD.cardDatabase.firstWhere(
            (element) => this.text == element.descricao); //problem here :(
      }
      print(cardResp.titulo + " " + cardResp.descricao);
      if (cardResp.titulo == cardH.text || cardResp.descricao == cardH.text) {
        print("são correspondentes");
        return true;
      }
    }

    return false;
  }

  CardHalf.fromJson(Map<String, dynamic> json) {
    this.text = json['text'] ?? "invalid";
    this.isTituloFace = json['isTituloFace'] ?? "invalid";
    this.isFaceUp = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = this.text;
    data['isTituloFace'] = this.isTituloFace;
    return data;
  }
}
