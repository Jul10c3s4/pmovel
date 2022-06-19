import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
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
        title: Text("JOGOS INTERATIVOS"),
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
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                SizedBox(height: 16),
              ]),
            ),
            /*
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
              color: Color(0xFF351B75),
              child: Column(children: [
                /*
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 128),
                  color: Colors.black,
                  child: Text(
                    "barra tutorial",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                */
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  
                  Text(
                    "barra tutorial",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      backgroundColor: Color(0xFF180C36),
                    ),
                  ),
                ]),
                SizedBox(height: 16),
                Text(
                  "instruções",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "flashcardsHalfPair",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFB6CCD7),
                  ),
                ),
                
              ]),
            ),
            */
            AlertDialog(
                title: Center(
                  child: Text(
                    "tutorial",
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
                    "*asdf asdfasdfasdfasfgbdfsfafsfdsfgg",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  new Text(
                    "asdkfsaldhfaslbjflhkdbfdhlbkfshlboriehbfdhsbhjvfs",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  new ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "flashcardsHalfPair",
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

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
            backgroundColor: Colors.green,
          ),
        ],
        selectedItemColor: Color(0xFFD0C3F1),
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF351B75),
        currentIndex: 0,
        /*falta colocar a cor do item quando ele não está selecionado*/
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
