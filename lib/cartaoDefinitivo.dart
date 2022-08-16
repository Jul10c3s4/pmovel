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
}
