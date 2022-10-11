class Atributos {
   late final String? materia;
   late final String? titulo;
   late final String? descricao;

  Atributos({this.materia, this.titulo, this.descricao});

  Atributos.fromJson(Map<String, dynamic> json) {
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