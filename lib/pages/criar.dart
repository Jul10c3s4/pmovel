import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF6E39F5),
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: const Text("MENU DE CRIAÇÃO"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.deepPurple[100]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "B",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                        const Text("/",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "S",
                            style: TextStyle(
                                fontSize: 30,
                                decoration: TextDecoration.underline,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: const Border(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black))),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                size: 30,
                              )),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue[50],
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                            style: TextStyle(fontSize: 25),
                            maxLines: 2,
                            decoration: InputDecoration.collapsed(
                              hintText: "Clique aqui para inserir seu título",
                            )),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      color: Colors.blue[50],
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                            style: TextStyle(fontSize: 20),
                            maxLines: 8,
                            decoration: InputDecoration.collapsed(
                              hintText: "Clique aqui para inserir seu texto",
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF6E39F5),
            border: Border.all(width: 0, color: const Color(0xFF6E39F5)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple[100]),
                    ),
                    child: const Text("CLIQUE AQUI PARA CONCLUIR"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
