import 'package:app/pages/pergunta1.dart';
import 'package:app/pages/pergunta2.dart';
import 'package:flutter/material.dart';
import 'flashCardsHalfPair.dart';
import 'jogo_memoria.dart';

class JogosPage extends StatefulWidget {
  @override
  _JogosPageState createState() => _JogosPageState();
}

class _JogosPageState extends State<JogosPage> {
  @override
  Widget build(BuildContext context) {
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Jogos"),
        backgroundColor: Color(0xFF180C36),
        /*centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'back',
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'more',
            onPressed: () {},
          ),
        ],*/
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD0C3F1),
          ),
          child: Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            SizedBox(width: 16),
          ]),
          padding: EdgeInsets.all(16),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF6E39F5),
              /*
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              */
            ),
            padding: EdgeInsets.all(16),
            //margin: EdgeInsets.only(top: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: onPressedButton,
                    child: Text(
                      "CARTÃO - FRENTE",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onPressedButton2,
                    child: Text(
                      "CARTÃO - VERSO",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onPressedButton3,
                    child: Text(
                      "JOGO DA MEMÓRIA",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FCHPairPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "FlashcardsHalfPair",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  SizedBox(height: 16),
                ]),
          ),
        ),
      ]),
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Pergunta1Page();
        },
      ),
    );
  }

  void onPressedButton2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Pergunta2Page();
        },
      ),
    );
  }

  void onPressedButton3() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return JogoMemoriaPage();
        },
      ),
    );
  }
}
