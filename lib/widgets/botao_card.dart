import 'package:flutter/material.dart';
import 'package:app/pages/materias_cards_subtopicos.dart';
import 'package:app/domain/card_materia.dart';

class BotaoCards extends StatefulWidget {
  final CardMateria cardMateria;

  const BotaoCards({
    Key? key,
    required this.cardMateria,
  }) : super(key: key);

  @override
  State<BotaoCards> createState() => _BotaoCards();
}

class _BotaoCards extends State<BotaoCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MateriasCardsSubtopicos(
                cardMateria: widget.cardMateria,
              );
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      '${widget.cardMateria.assunto}',
                      style: TextStyle(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
