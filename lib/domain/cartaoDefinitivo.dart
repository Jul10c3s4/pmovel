import '../domain/half_card.dart';

class CardDef {
  late String titulo;
  late String descricao;
  late String video;
  late String questao;
  late String image;
  late String gabarito;

  CardDef({
    required this.titulo,
    required this.descricao,
    this.video = "...",
    this.questao = "sem questao",
    this.image = "...",
    this.gabarito = "sem gabarito",
  });

  static CardDef remakeCardDByCardH(CardHalf ch, List<CardDef> cardDatabase) {
    CardDef? cd1;
    for (CardDef cd in cardDatabase) {
      if (cd.titulo == ch.text || cd.descricao == ch.text) {
        cd1 = cd;
      }
    }

    return cd1 ?? new CardDef(titulo: "invalid", descricao: "invalid");
  }

  static List<CardDef> remakeCardDListByCardHList(
      List<CardHalf> listaCH, List<CardDef> cardDatabase) {
    List<CardDef> listaConstruida = <CardDef>[];

    for (CardHalf cardH in listaCH) {
      CardDef novoCardDef = remakeCardDByCardH(cardH, cardDatabase);
      listaConstruida.add(novoCardDef);
    }

    return listaConstruida;
  }

  CardDef.fromJson(Map<String, dynamic> json) {
    this.titulo = json['titulo'] ?? "sem titulo";
    this.descricao = json['descricao'] ?? "sem desc";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    return data;
  }

  @override
  String toString() {
    return this.titulo + " ---- " + this.descricao;
  }
}
