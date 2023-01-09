import 'package:app/data/bd.dart';
import 'package:app/data/sharedPreferences.dart';
import 'package:app/domain/cartaoDefinitivo.dart';
import 'package:app/domain/half_card.dart';
import 'package:app/pages/ygor/jogo_memoria.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/ygor/pergunta1.dart';
import 'package:app/pages/ygor/pergunta2.dart';
import 'package:app/pages/ygor/jogo_memoria.dart';
import 'package:app/domain/half_card.dart';
import 'package:app/domain/cartaoDefinitivo.dart';
import 'package:app/data/bd.dart';
import 'package:app/data/sharedPreferences.dart';
import 'package:app/widgets/selection_cardH_dialog.dart';

import 'dart:async';
import 'dart:core';
import 'package:app/widgets/selection_cardH_dialog.dart';
import '../../data/api/fchpApi.dart';

class FCHPairPage extends StatefulWidget {
  @override
  _FCHPairPageState createState() => _FCHPairPageState();
}

class _FCHPairPageState extends State<FCHPairPage> {
  List<CardHalf> baralho = makeCardsHFaceUp(getHalfCard(5));
  List<CardHalf> hand1 = [];
  List<CardHalf> hand2 = [];
  List<CardHalf> trash = [];

  TextEditingController comparar1_controller = new TextEditingController();
  TextEditingController comparar2_controller = new TextEditingController();

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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                  child: Card(
                    child: Center(child: Text('Card Text' + index.toString())),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6E39F5),
                ),
                padding: EdgeInsets.all(16),
                //margin: EdgeInsets.only(top: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          comprarCard();
                          buildShowCardDialog(
                            context: context,
                            listCardH: baralho,
                            titulo: "baralho",
                          );
                        },
                        child: buildCard(
                          context: context,
                          cardH:
                              convertCardDInHalfCard([BD.cardDatabase[0]])[0],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            //mostra o cards in the trash
                            buildShowCardDialog(
                              context: context,
                              listCardH: trash,
                              titulo: "trash",
                            );
                          });
                        },
                        child: buildCard(
                          context: context,
                          cardH:
                              new CardHalf(text: "vazio", isTituloFace: false),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6E39F5),
              ),
              height: 50,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      List<bool> respostas = await showDialog<List<bool>>(
                            context: context,
                            builder: (context) => CustomDialog(
                                options: retornaTextosDoHalfCard(hand1),
                                qSelection: 1),
                          ) ??
                          [];

                      if (respostas.length > 0) {
                        print(respostas.toString());

                        int indice = -1;
                        for (int i = 0; i < respostas.length; i++) {
                          if (respostas[i] == true) {
                            indice = i;
                            break;
                          }
                        }

                        descartarCard(hand1, indice);
                      }
                    },
                    child: Text(
                      "descartar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //inputIndicesComparacao();
                      //
                      if (hand1.length >= 2) {
                        List<bool> escolhas = await showDialog<List<bool>>(
                              context: context,
                              builder: (context) => CustomDialog(
                                  options: retornaTextosDoHalfCard(hand1),
                                  qSelection: 2),
                            ) ??
                            <bool>[];

                        List<int> listaIndices = <int>[];
                        for (int i = 0; i < escolhas.length; i++) {
                          if (escolhas[i] == true) {
                            listaIndices.add(i);
                          }
                        }

                        if (hand1[listaIndices[0]]
                            .equals(hand1[listaIndices[1]])) {
                          print("são correspondentes esses cards");

                          descartarCard(hand1, listaIndices[1]);
                          descartarCard(hand1, listaIndices[0]);
                        }
                      }

                      //converter a variável escolhas para CardHalf
                      //--> usar método .equals() para verificar o correspondência entre eles
                    },
                    child: Text(
                      "comparar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await SharedPrefsHelper.saveStateFHCP(
                        /*
                        deck: CardDef.remakeCardDListByCardHList(
                            baralho, BD.cardDatabase),
                        hand: CardDef.remakeCardDListByCardHList(
                            hand1, BD.cardDatabase),
                        trash: CardDef.remakeCardDListByCardHList(
                            trash, BD.cardDatabase),
                        */
                        deck: baralho,
                        hand: hand1,
                        trash: trash,
                      );
                    },
                    child: Text(
                      "save",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //await SharedPrefsHelper.cleanStateFCHP();
                    },
                    child: Text(
                      "reset",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      List<List<CardHalf>> databaseDoEstadoDeJogo =
                          await SharedPrefsHelper.getStateFHCP();

                      print("estado a seguir vai ser carregado{ ");
                      print(databaseDoEstadoDeJogo[0].join("==="));
                      print(databaseDoEstadoDeJogo[1].join("==="));
                      print(databaseDoEstadoDeJogo[2].join("==="));
                      print("}");

                      setState(() {
                        baralho = databaseDoEstadoDeJogo[0];
                        hand1 = databaseDoEstadoDeJogo[1];
                        trash = databaseDoEstadoDeJogo[2];
                      });
                    },
                    child: Text(
                      "load",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      List<List<CardHalf>> listaCompleta =
                          await FHCP_API.findAllCards();

                      setState(() {
                        baralho = listaCompleta[0];
                        hand1 = listaCompleta[1];
                        trash = listaCompleta[2];
                      });
                    },
                    child: Text(
                      "load_API",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        //FHCP_API.dropDatabase();

                        FHCP_API.uploadCards(baralho, hand1, trash);

                        const snackBar = SnackBar(
                          content: Text('Cards Salvos'),
                        ); 
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Text(
                      "save_on_API",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0C3F1),
              ),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hand1.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      //apareca alertDialog detalhando a carta
                      buildAlertDCard(context: context, cardH: hand1[index]);
                    },
                    child: buildCard(
                      context: context,
                      cardH: hand1[index],
                    ),
                  ),

                  //
                  //Card(
                  //  child:
                  //      Center(child: Text('Card Text' + index.toString())),
                  //),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods. Dialog
    );
  }

  void comprarCard() {
    setState(() {
      CardHalf cardRemovido = baralho.removeAt(0);
      hand1.add(cardRemovido);
    });
  }

  void descartarCard(List<CardHalf> hand, int indice) {
    //hand1
    setState(() {
      CardHalf cardRemovido = hand.removeAt(indice);
      trash.insert(0, cardRemovido);
    });
  }

  Widget buildCard({
    required BuildContext context,
    required CardHalf cardH,
  }) {
    return Container(
      height: 96,
      width: 64,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(0),
      child: Card(
        semanticContainer: true,
        color: (cardH.isFaceUp == false)
            ? const Color(0xFFB6CCD7)
            : const Color(0xFF351B75),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(1),
        child: Center(
          child: Text(
            cardH.isFaceUp ? cardH.text : " ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      color: Color(0xFFB6CCD7),
    );
  }

  buildShowCardDialog({
    required BuildContext context,
    required List<CardHalf> listCardH,
    String titulo = "detalhes",
  }) {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              titulo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                backgroundColor: Color(0xFF180C36),
              ),
            ),
          ),
          titlePadding: const EdgeInsets.all(8),
          scrollable: true,
          backgroundColor: Color(0xFF351B75),
          content: Container(
            decoration: BoxDecoration(
              color: Color(0xFFD0C3F1),
            ),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCardH.length,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                height: 10,
                child: InkWell(
                  onTap: () {
                    //chamar um novo alertDialog
                    buildAlertDCard(context: context, cardH: listCardH[index]);
                  },
                  child: buildCard(
                    context: context,
                    cardH: listCardH[index],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            new TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            new TextButton(
              child: new Text(
                "Fechar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]),
    );
  }
}

List<CardHalf> getHalfCard(int qPares) {
  if (qPares > 0 && qPares < (BD.cardDatabase.length / 2)) {
    List<CardDef> lista = BD.cardDatabase;
    lista.shuffle();

    lista = lista.getRange(0, qPares).toList();

    List<CardHalf> listaHalfCard = convertCardDInHalfCard(lista);

    listaHalfCard.shuffle();

    return listaHalfCard;
  }

  return [];
}

List<CardHalf> makeCardsHFaceUp(List<CardHalf> listaInput) {
  List<CardHalf> lista2 = new List<CardHalf>.from(listaInput);

  lista2.forEach((element) {
    element.isFaceUp = true;
  });

  return lista2;
}

//algo parecido com a função map() do JS
List<String> retornaTextosDoHalfCard(List<CardHalf> l) {
  List<String> ls = [];
  for (int i = 0; i < l.length; i++) {
    ls.add(l[i].text);
  }

  return ls;
}

//mostra um AlertDialog com um ListView.builder()
//que mostra todos os cards na mão pede para selecionar os cards
//que serão escolhidos
