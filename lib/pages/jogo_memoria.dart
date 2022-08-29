import 'package:flutter/material.dart';
import '../data/bd.dart';
import '../domain/cartaoDefinitivo.dart';
import '../domain/half_card.dart';

class JogoMemoriaPage extends StatefulWidget {
  List<CardDef> lista = BD.cardDatabase;

  @override
  _JogoMemoriaPageState createState() => _JogoMemoriaPageState();
}

class _JogoMemoriaPageState extends State<JogoMemoriaPage> {
  List<CardHalf> mCards = getHalfCard();
  int qMemCardFaceUp = 0;
  bool isEndedGame = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !isEndedGame ? "Jogo da Memória" : "Voce Venceu",
        ),
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
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6E39F5),
              ),
              padding: EdgeInsets.all(16),
              //margin: EdgeInsets.only(top: 16),
              child: buildGridView(),
            ),
          ]),
        ),
      ]),
    );
  }

  virarHalfCard(CardHalf halfCard) {
    setState(() {
      if (halfCard.isFaceUp == false && !halfCard.isClear) {
        halfCard.isFaceUp = true;
        qMemCardFaceUp++;
      }
    });
  }

  Widget buildGridView() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        //itemCount: BD.cardDatabase.length,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          //return buildCard(context: context, cardD: BD.cardDatabase[index]);

          return buildCard(context: context, cardH: mCards[index]);
        });
  }

  Widget buildCard({
    required BuildContext context,
    required CardHalf cardH,
  }) {
    return Container(
      height: 96,
      width: 64,
      padding: const EdgeInsets.all(0),
      child: Card(
        semanticContainer: true,
        color: (cardH.isFaceUp == false)
            ? const Color(0xFFB6CCD7)
            : const Color(0xFF351B75),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () async {
            //rebuild Gridview
            //
            if (qMemCardFaceUp < 2) {
              virarHalfCard(cardH);
              buildAlertDCard(context: context, cardH: cardH);
              CardHalf cH1 = mCards.firstWhere(
                  (element) => element.isFaceUp == true && !element.isClear);
              CardHalf cH2 = mCards.lastWhere(
                  (element) => element.isFaceUp == true && !element.isClear);

              print(cH1.text);
              print(cH2.text);
              if (cH1.equals(cH2) && qMemCardFaceUp == 2) {
                qMemCardFaceUp = 0;
                cH1.isClear = true;
                cH2.isClear = true;

                if (mCards.every((element) => element.isClear)) {
                  setState(() {
                    isEndedGame = true;
                  });
                }
              } else if (qMemCardFaceUp >= 2) {
                await Future.delayed(Duration(seconds: 3));
                setState(
                  () {
                    mCards.forEach((cardH) {
                      cardH.isFaceUp = false;
                      cardH.isClear = false;
                    });
                    qMemCardFaceUp = 0;
                  },
                );
              }
            }
          },
          child: Center(
            child: Text(
              cardH.isFaceUp ? cardH.text : " ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(1),
      ),
      color: Color(0xFFB6CCD7),
    );
  }
}

List<CardHalf> convertCardDInHalfCard(List<CardDef> listCardsD) {
  List<CardHalf> listaHC = <CardHalf>[];

  listCardsD.forEach((element) {
    listaHC.add(
      new CardHalf(
        text: element.titulo,
        isTituloFace: true,
        isFaceUp: false,
      ),
    );
  });

  listCardsD.forEach((element) {
    listaHC.add(new CardHalf(
      text: element.descricao,
      isTituloFace: false,
      isFaceUp: false,
    ));
  });

  return listaHC;
}

List<CardHalf> getHalfCard() {
  List<CardDef> listaJogoM = BD.cardDatabase;
  listaJogoM.shuffle();
  listaJogoM = listaJogoM.getRange(0, 6).toList();

  List<CardHalf> listaHalfCard = convertCardDInHalfCard(listaJogoM);

  listaHalfCard.shuffle();
  return listaHalfCard;
}

buildAlertDCard({
  required BuildContext context,
  required CardHalf cardH,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
        title: Center(
          child: const Text(
            "detalhes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              backgroundColor: Color(0xFF180C36),
            ),
          ),
        ),
        titlePadding: const EdgeInsets.all(8),
        scrollable: true,
        backgroundColor: const Color(0xFF351B75),
        content:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          new Text(
            cardH.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ]),
        actions: <Widget>[
          // define os botões na base do dialogo
          new TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
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
