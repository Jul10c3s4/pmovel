import 'package:flutter/material.dart';
import 'package:app/widgets/perguntas.dart';
import 'package:app/pages/ygor/jogos_page.dart';
import 'package:app/data/bd.dart';
//import '../widget/perguntas.dart';

class Pergunta2Page extends StatefulWidget {
  @override
  _Pergunta2PageState createState() => _Pergunta2PageState();
}

class _Pergunta2PageState extends State<Pergunta2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTÃO - VERSO"),
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
              cardD: BD.sortearCard(), isTitleQuestion: false),
        ),
      ]),
    );
  }
}
