import 'package:flutter/material.dart';
import '../pergunta1.dart';
import '../pergunta2.dart';
import '../jogo_memoria.dart';
import '../domain/half_card.dart';
import '../domain/cartaoDefinitivo.dart';
import '../data/bd.dart';

class FCHPairPage extends StatefulWidget {
  @override
  _FCHPairPageState createState() => _FCHPairPageState();
}

class _FCHPairPageState extends State<FCHPairPage> {
  CardHalf testeCard = convertCardDInHalfCard([BD.cardDatabase[0]])[1];

  List<CardHalf> baralho = makeCardsHFaceUp(getHalfCard(5));
  List<CardHalf> hand1 = [];
  List<CardHalf> hand2 = [];
  List<CardHalf> trash = [];

  TextEditingController comparar1_controller = new TextEditingController();
  TextEditingController comparar2_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    testeCard.isFaceUp = true;

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
                      child:
                          Center(child: Text('Card Text' + index.toString())),
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
                            cardH: testeCard,
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
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (hand1.length > 0) {
                          int indice = hand1.length - 1;

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
                      onPressed: () {
                        inputIndicesComparacao();
                      },
                      child: Text("comparar"),
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
            ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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
      trash.add(cardRemovido);
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
                      buildAlertDCard(
                          context: context, cardH: listCardH[index]);
                    },
                    child: buildCard(
                      context: context,
                      cardH: listCardH[index],
                    ),
                  )

                  /*
              Card(
                child: Center(child: Text('Card Text' + index.toString())),
              ),
              */
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

  /*
  Future<List<int>>? showSelectionCardHDialog(BuildContext context) async {
    Future<List<int>>? indicesSelecionado = await showDialog<Future<List<int>>>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Selecione 2 cards",
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
                itemCount: hand1.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                  child: InkWell(
                    onTap: () {
                      //Selecionar um card e deixar selecionado com uma borda amarela
                      //para isso vai usar o operador ternário no parâmetro
                      //X --> Container(decoration: BoxDecoretion(Border:X),),
                      //os indices selecionados vão para a variavel indicesSelecionado

                      buildAlertDCard(context: context, cardH: hand1[index]);
                    },
                    child: buildCard(
                      context: context,
                      cardH: hand1[index],
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              new TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    [0, 1, 2, 3, 4],

                    //valor que será recebidd por indicesSelecionados
                    //
                  );
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
                  Navigator.of(context).pop(
                    [4, 3],
                  );
                },
              ),
            ]
          );
          //
            fazer um alertDialog que contenha um ListView.builder() 
            que contenha todos os cards da hand1, 
            só que com o InkWell programado para selecionar os cards
            que aparecerem na tela
          //
        });

    return indicesSelecionado;
  }
  */

  void inputIndicesComparacao() {
    Future<List<int>?> indicesEscolhidos = showDialog<List<int>>(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Center(
                child: Text(
                  "Selecione 2 cards",
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
                height: 200,
                child: Column(children: [
                  TextField(
                    controller: comparar1_controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'card1-index',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                      controller: comparar2_controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "card2-index",
                      )),
                ]),
              ),
              actions: <Widget>[
                new TextButton(
                  onPressed: () {
                    int card1Index = int.parse(comparar1_controller.text);
                    int card2Index = int.parse(comparar2_controller.text);
                    comparar1_controller.text = "";
                    comparar2_controller.text = "";

                    if ((card1Index < hand1.length && card1Index >= 0) &&
                        (card2Index < hand1.length && card2Index >= 0) &&
                        (card1Index != card2Index)) {
                      if (hand1[card1Index].equals(hand1[card2Index])) {
                        //rodar método fazerPar
                        //

                        /*
                        showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Center(
                                child: Text(
                                  "mensagem",
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
                                child: Text("VOCE FEZ UM PAR"),
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
                              ]),
                        );
                        */
                      }
                    }

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
              ]);
        });
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

//mostra um AlertDialog com um ListView.builder()
//que mostra todos os cards na mão pede para selecionar os cards
//que serão escolhidos
