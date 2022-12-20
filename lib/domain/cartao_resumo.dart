class CartaoResumo {
  late final String materia;
  late final String titulo;
  late final String descricao;

  CartaoResumo({required this.materia, required this.titulo, required this.descricao});

  CartaoResumo.fromJson(Map<String, dynamic> json) {
    materia = json['materia'];
    titulo = json['titulo'];
    descricao = json['descricao'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['materia'] = this.materia;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    return data;
  }
}
