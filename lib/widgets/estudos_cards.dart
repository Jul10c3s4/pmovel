import 'package:app/domain/atributos_card.dart';
import 'package:app/pages/detalhes_card.dart';
import 'package:flutter/material.dart';

class EstudosCard extends StatefulWidget {
  final Atributos detalhes;

  const EstudosCard({
    Key? key,
    required this.detalhes,
  }) : super(key: key);

  @override
  _EstudosCardState createState() => _EstudosCardState();
}

class _EstudosCardState extends State<EstudosCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CardDetalhes(
                detalhes: widget.detalhes,
              );
            },
          ),
        );
      },

      child: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
                  Text(
                    widget.detalhes.titulo,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text('descrição: ${widget.detalhes.descricao}'),
    ]
    ),
    ),
    ),
    );

  }
  }
