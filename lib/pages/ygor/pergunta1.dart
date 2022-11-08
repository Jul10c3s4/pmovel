import 'package:flutter/material.dart';
import 'package:app/widgets/perguntas.dart';
import 'package:app/pages/ygor/jogos_page.dart';
import 'package:app/data/bd.dart';
//import '../widget/perguntas.dart';

class Pergunta1Page extends StatefulWidget {
  @override
  _Pergunta1PageState createState() => _Pergunta1PageState();
}

class _Pergunta1PageState extends State<Pergunta1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTÃO - FRENTE"),
        backgroundColor: Color(0xFF180C36),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'back',
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'more',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: new PerguntasWidget(
              cardD: BD.sortearCard(), isTitleQuestion: true),
        ),
      ]),
    );
  }
}
