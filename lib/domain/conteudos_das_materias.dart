import 'package:flutter/material.dart';

class Materias {
  final String title;
  final IconData icon;

  Materias(
      this.title, this.icon);

}

class Search {
  final String name;
  final IconData icon;

  Search(
      this.name, this.icon);
}

class Conteudos {
  final String titulo;
  final String titleAppBar;
  final IconData icon;
  final String imagem;
  final String conceito;

  Conteudos(
      this.titulo, this.icon, this.titleAppBar, this.imagem, this.conceito);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    String iconString = icon.toString();

    data['title'] = titulo;
    data['iconName'] = iconString;
    data['titleAppBar'] = titleAppBar;
    data['imageLink'] = imagem;
    data['concept'] = conceito;
    return data;
  }
}
