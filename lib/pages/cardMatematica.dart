import 'package:flutter/material.dart';
import '../domain/atibutosConteudos.dart';
import 'GeometriaDivisoes.dart';

class CardMatematica extends StatefulWidget {
  final Conteudos objeto1;
  final Conteudos objeto2;
  final Conteudos objeto3;

  CardMatematica({
    Key? key,
    required this.objeto1,
    required this.objeto2,
    required this.objeto3,
  }) : super(key: key);

  @override
  _CardMatematica createState() => _CardMatematica();
}

class _CardMatematica extends State<CardMatematica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E39F5),
      body: ListView(
        children: [
          buildPageAppBar(titleAppBar: widget.objeto1.titleAppBar),
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
              buildPageContent(
                  objeto1: widget.objeto1,
                  objeto2: widget.objeto2,
                  objeto3: widget.objeto3),
            ],
          ),
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

  buildPageAppBar({
    required String titleAppBar,
  }) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          title: Text(
            titleAppBar,
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color(0xFF180C36),
        ),
      ],
    );
  }

  buildPageContent({
    required Conteudos objeto1,
    required Conteudos objeto2,
    required Conteudos objeto3,
  }) {
    return Column(
      children: [
        const SizedBox(height: 60),
        GeometriasDivisoes(
          texto: objeto1.titulo,
          icone: objeto1.icon,
          classe: objeto1,
        ),
        const SizedBox(height: 60),
        GeometriasDivisoes(
          texto: objeto2.titulo,
          icone: objeto2.icon,
          classe: objeto2,
        ),
        const SizedBox(height: 60),
        GeometriasDivisoes(
          texto: objeto3.titulo,
          icone: objeto3.icon,
          classe: objeto3,
        ),
      ],
    );
  }
}
