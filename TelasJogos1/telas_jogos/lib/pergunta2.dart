import 'package:flutter/material.dart';

class Pergunta2Page extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _Pergunta2PageState createState() => _Pergunta2PageState();
}

class _Pergunta2PageState extends State<Pergunta2Page> {
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
        title: Text("CARTÃO - VERSO"),
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
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF6E39F5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: EdgeInsets.all(16),
            //margin: EdgeInsets.only(top: 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Card(
                color: Color(0xFF351B75),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        "Pergunta n°1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "00:01:36",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ]),
                    SizedBox(height: 16),
                    Text(
                      "Texto da Pergunta",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Opcao 1",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF351B75),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Opcao 2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF351B75),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Opcao3",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF351B75),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Opcao4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF180C36),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Enviar Resposta",
                    style: TextStyle(
                      color: Colors.black,
                    ),
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

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
