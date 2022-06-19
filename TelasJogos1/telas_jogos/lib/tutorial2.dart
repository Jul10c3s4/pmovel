import 'package:flutter/material.dart';

class Tutorial2Page extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _Tutorial2PageState createState() => _Tutorial2PageState();
}

class _Tutorial2PageState extends State<Tutorial2Page> {
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
        title: Text("TUTORIAL"),
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
            padding: const EdgeInsets.all(16),
            color: Color(0xFF351B75),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "FlashcardsHalfPair",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "instruções dfdhfahadsoaufrfeoiiifevofnerODSASFFDVPNURNVURNRAJSDFAJJVRUNFJSDANNVDIRJFAVAANROJFDJOFSAJVJNIPNPvovnafvNVPOSDNFBJDSFJNBSUGJEUERPVNDJFRNEVPDFJSNLVJSDNUERNVJKL",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ]),
          ),
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
