import 'package:flutter/material.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:app/pages/assunto_page.dart';
import 'package:app/widgets/estudos_cards.dart';

class MeuCard extends StatefulWidget {
  const MeuCard({Key? key}) : super(key: key);

  @override
  _MeuCardState createState() => _MeuCardState();
}

class _MeuCardState extends State<MeuCard> {
  Atributos card1 = Atributos(
    titulo: 'MEU PRIMEIRO CARD',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  );
  Atributos dart = Atributos(
    titulo: 'Aprenda Linguagem Dart',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  );
  Atributos html = Atributos(
    titulo: 'Aprenda Linguagem HTML',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  );
  Atributos texto = Atributos(
    titulo: 'Formatação de Texto',
    descricao: 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF180C36),
        title: const Text(
          'MEUS CARDS',
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: const Color(0xff6239db),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            EstudosCard(detalhes: card1),
            EstudosCard(detalhes: dart),
            EstudosCard(detalhes: html),
            EstudosCard(detalhes: texto),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
        selectedItemColor: const Color(0xFFD0C3F1),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF351B75),
        currentIndex: 0,
      ),
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const AssuntoPage();
        },
      ),
    );
  }
}
