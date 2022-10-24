import 'package:app/domain/atributos_card.dart';
import 'package:app/pages/meusCards/detalhes_card.dart';
import 'package:flutter/material.dart';

class EstudosCard extends StatefulWidget {
  final Atributos detalhe;

  const EstudosCard({
    Key? key,
    required this.detalhe,
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
                detalhes: widget.detalhe,
              );
            },
          ),
        );
      },
       child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white54,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.detalhe.titulo,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.detalhe.descricao,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            //buildImage(),
          ],
        ),
      ),
    );
  }
  
}
