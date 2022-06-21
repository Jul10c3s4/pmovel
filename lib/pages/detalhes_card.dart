import 'package:app/domain/atributos_card.dart';
import 'package:flutter/material.dart';

class CardDetalhes extends StatefulWidget {
  final Atributos detalhes;

  const CardDetalhes({
    Key? key,
    required this.detalhes,
  }) : super(key: key);

  @override
  _CardDetalhesState createState() => _CardDetalhesState();
}

class _CardDetalhesState extends State<CardDetalhes> {
  Atributos get pacote => widget.detalhes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
                Text(
                  pacote.titulo,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 12),
                Text(pacote.descricao),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,),
    ]
    ),
    );
  }
}