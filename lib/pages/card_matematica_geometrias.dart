import 'package:flutter/material.dart';
import 'conteudos_matematica.dart';
//import 'card_estrutura.dart';

class CardMatematica extends StatefulWidget {
  const CardMatematica({Key? key}) : super(key: key);
  @override
  _CardMatematica createState() => _CardMatematica();
}

class _CardMatematica extends State<CardMatematica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MATEMÁTICA - GEOMETRIAS',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Color(0xFF180C36),
      ),
      backgroundColor: Color(0xFF6E39F5),
      body: ListView(
        children: [
          Column(
            children: [
              //color: Color(0xFFB6CCD7),
              Card(
                color: Color(0xFFB6CCD7),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PESQUISAR',
                        style: TextStyle(fontSize: 30),
                      ),
                      Icon(Icons.search, size: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          /*const GeometriasDivisoes(
            texto: 'GEOMETRIA PLANA',
            icone: Icons.calculate,
            page: ConteudosGeometriaAnalitica(
                nomeBotoes: "Vídeo-Aulas", onPressed: "onPressed1"),
          ),*/
          const SizedBox(height: 60),
         /* const GeometriasDivisoes(
            texto: 'GEOMETRIA ESPACIAL',
            icone: Icons.category,
            /*page: ConteudosGeometriaAnalitica(
                nomeBotoes: "Vídeo-Aulas", onPressed: "onPressed2"),*/
          ),*/
          const SizedBox(height: 60),
          /*const GeometriasDivisoes(
            texto: 'GEOMETRIA ANALÍTICA',
            icone: Icons.circle,
            page: ConteudosGeometriaAnalitica(
                nomeBotoes: "Vídeo-Aulas", onPressed: "onPressed3"),
          ),*/
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
        selectedItemColor: const Color(0xFFD0C3F1),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF351B75),
        currentIndex: 0,
      ),
    );
  }
}
