class CardDef {
  final String titulo;
  final String descricao;

  final String video;
  final String questao;
  final String image;
  final String gabarito;

  CardDef({
    required this.titulo,
    required this.descricao,
    this.video = "...",
    this.questao = "sem questao",
    this.image = "...",
    this.gabarito = "sem gabarito",
  });

  CardDef.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    return data;
  }
}
