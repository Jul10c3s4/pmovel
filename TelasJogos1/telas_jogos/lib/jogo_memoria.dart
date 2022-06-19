import 'package:flutter/material.dart';

class JogoMemoriaPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _JogoMemoriaPageState createState() => _JogoMemoriaPageState();
}

class _JogoMemoriaPageState extends State<JogoMemoriaPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Jogo da Memória"),
        backgroundColor: Color(0xFF180C36),
        centerTitle: true,
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
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard(),
                    buildCard(),
                    buildCard(texto: "ortocentro"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard(),
                    buildCard(),
                    buildCard(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard(),
                    buildCard(),
                    buildCard(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard(),
                    buildCard(),
                    buildCard(),
                  ],
                ),
              ]),
            ),

            AlertDialog(
                title: Center(
                  child: Text(
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
                backgroundColor: Color(0xFF351B75),
                content: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  new Text(
                    "Texto da carta",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  new ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB6CCD7),
                    ),
                  ),
                ]),
                actions: <Widget>[
                  // define os botões na base do dialogo
                  new FlatButton(
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

            // background-color
            // conteiner do texto
            // barra de cima
          ]),
        ),
      ]),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget buildCard({
  String texto: " ",
}) {
  return Container(
    height: 96,
    width: 64,
    padding: const EdgeInsets.all(0),
    child: Card(
      semanticContainer: true,
      color: (texto == " ") ? Color(0xFFB6CCD7) : Color(0xFF351B75),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: Center(
          child: Text(
            texto,
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
    /*
    Center(
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    */
    color: Color(0xFFB6CCD7),
  );
}
