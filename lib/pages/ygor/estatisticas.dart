import 'package:flutter/material.dart';
import '../pages/telas_jogos/pergunta1.dart';
import '../pages/telas_jogos/pergunta2.dart';
import '../pages/telas_jogos/jogo_memoria.dart';
import '../domain/half_card.dart';
import '../domain/cartaoDefinitivo.dart';
import '../data/bd.dart';
import '../widget/selection_cardH_dialog.dart';

class EstatisticasPage extends StatefulWidget {
  @override
  _EstatisticasPageState createState() => _EstatisticasPageState();
}

class _EstatisticasPageState extends State<EstatisticasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flashCardsHalfPair"),
        backgroundColor: Color(0xFF180C36),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0C3F1),
              ),
              height: 100,
              child: Text("TEXTO1"),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6E39F5),
                ),
                padding: EdgeInsets.all(16),
                //margin: EdgeInsets.only(top: 16),
                child: Text("FGH"),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0C3F1),
              ),
              height: 100,
              child: Text("ABCD"),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//mostra um AlertDialog com um ListView.builder()
//que mostra todos os cards na mão pede para selecionar os cards
//que serão escolhidos
