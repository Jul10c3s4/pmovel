import 'package:flutter/material.dart';
import '../domain/atibutosConteudos.dart';

class PaginaDeConteudos extends StatefulWidget {

  final Conteudos nomeClasse;

  PaginaDeConteudos({
    Key? key,
    required this.nomeClasse,
  }) : super(key: key);

  @override
  _PaginaDeConteudos createState() => _PaginaDeConteudos();
}

class _PaginaDeConteudos extends State<PaginaDeConteudos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF180C36),
      backgroundColor: const Color(0xFF293462),
      appBar: AppBar(
        backgroundColor: const Color(0xFF224B0C),
        centerTitle: true,
        title: Text(
          widget.nomeClasse.titulo,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  InkWell(
                    child: Image.network('${widget.nomeClasse.imagem}'),
                    onTap: onTap,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.play_lesson,
                          color: Colors.white70,
                        ),

                        Icon(
                          Icons.laptop_mac,
                          color: Colors.white70,
                        ),

                        Icon(
                          Icons.bookmark,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),

                  Card(
                    color: Colors.white70,
                    child: Column(
                      children: [
                        //MarkdwonStyleSheet(),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '${widget.nomeClasse.conceito}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: onPressed4,
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      //size: 20,
                      backgroundColor: const Color(0xFF224B0C),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Voltar"
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {
    /*
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return '${widget.nomeClasse.video}',
        },
      ),
    );
    */
  }

  void onPressed4() {
    Navigator.pop(context);
  }
}
