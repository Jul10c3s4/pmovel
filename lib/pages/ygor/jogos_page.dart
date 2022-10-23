import 'package:flutter/material.dart';
import '../lib/pages/telas_jogos/pergunta1.dart';
import '../pages/telas_jogos/pergunta2.dart';
import '../pages/telas_jogos/jogo_memoria.dart';
import '../pages/telas_jogos/flashCardsHalfPair.dart';
import '../pages/telas_jogos/estatisticasPage.dart';

class JogosPage extends StatefulWidget {
  @override
  _JogosPageState createState() => _JogosPageState();
}

class _JogosPageState extends State<JogosPage> {
  @override
  Widget build(BuildContext context) {
    //DB_Helper.initDB();

    return Scaffold(
      appBar: AppBar(
        title: Text("Jogos"),
        backgroundColor: Color(0xFF180C36),
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new EstatisticasPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Estatísticas",
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

    //showSnackBar(CardDefDao.listarTudo()[1]["title"]);
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

  showSnackBar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
