import 'package:flutter/material.dart';

//listView não está funcionando (provavelmente porque ele pega o espaço todo da tela, não divide o body com outros widgets)

class EstatisticPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _EstatisticPageState createState() => _EstatisticPageState();
}

class _EstatisticPageState extends State<EstatisticPage> {
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
        title: Text("Estatísticas"),
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
      body: Container(
        color: Color(0xFF351B75),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            //ListTile(title: Text("Battery Full"), subtitle: Text("The battery is full."), leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")), trailing: Icon(Icons.star)),
            ListTile(
              title: Text(
                "grafico 1: ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "descricao do grafico 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),

              //trailing: Icon(Icons.star)
            ),
            Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 50,
              color: Colors.white,
            ),
            SizedBox(height: 16),

            ListTile(
              title: Text(
                "grafico 2: ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                "descricao do grafico 2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),

            Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 50,
              color: Colors.white,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
