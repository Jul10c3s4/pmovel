import 'package:flutter/material.dart';
import 'package:app/domain/card_materia.dart';
import 'package:app/widgets/botao_card.dart';

class Materias extends StatefulWidget {
  const Materias({Key? key}) : super(key: key);

  @override
  State<Materias> createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  CardMateria card1 = CardMateria(assunto: "Matemática");
  CardMateria card2 = CardMateria(assunto: "Biologia");
  CardMateria card3 = CardMateria(assunto: "História");
  CardMateria card4 = CardMateria(assunto: "Geografia");
  CardMateria card5 = CardMateria(assunto: "Sociologia");
  CardMateria card6 = CardMateria(assunto: "Filosofia");
  CardMateria card7 = CardMateria(assunto: "Negócios");
  CardMateria card8 = CardMateria(assunto: "programação");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF180C36),
        elevation: 10,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: const Text(
          'CARDS',
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: Color(0xFF6E39F5),
      body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pesquisar: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            BotaoCards(cardMateria: card1),
            BotaoCards(cardMateria: card2),
            BotaoCards(cardMateria: card3),
            BotaoCards(cardMateria: card4),
            BotaoCards(cardMateria: card5),
            BotaoCards(cardMateria: card6),
            BotaoCards(cardMateria: card7),
            BotaoCards(cardMateria: card8),
          ])),
    );
  }
}
