import 'package:sqflite/sqlite_api.dart';

class CartaoResumo {
  late final String materia;
  late final String titulo;
  late final String descricao;
  late final String imagem;
  
  CartaoResumo.nada();

  CartaoResumo(
      {required this.materia,
      required this.titulo,
      required this.descricao,
      required this.imagem});

  CartaoResumo.fromJson(Map<String, dynamic> json) {
    materia = json['materia'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagem = json['imagem'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['materia'] = this.materia;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    return data;
  }

  CartaoResumo.fromApiJson(Map<String, dynamic> json) {
    materia = json['assunto'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    imagem = json['imagem'];
  }
}
