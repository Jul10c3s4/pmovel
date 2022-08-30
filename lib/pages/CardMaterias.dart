import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/domain/atibutosConteudos.dart';
import 'package:untitled2/pages/cardMatematica.dart';

class CardMaterias extends StatefulWidget {
  const CardMaterias({Key? key}) : super(key: key);
  @override
  _CardMaterias createState() => _CardMaterias();
}

class _CardMaterias extends State <CardMaterias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E39F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF180C36),
        centerTitle: true,
        title: const Text(
          "Matérias",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  buildSearchFunction(nome: "PESQUISAR",  icon: Icons.search),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "PORTUGUÊS", icon: Icons.menu_book, objeto1: Conteudos.conteudosDeSubstantivos, objeto2: Conteudos.conteudosDeSubstantivos, objeto3: Conteudos.conteudosDeSubstantivos),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "MATEMÁTICA", icon: Icons.functions, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "HISTÓRIA", icon: Icons.hourglass_empty, objeto1: Conteudos.conteudosDePreHistoria, objeto2: Conteudos.conteudosDeEraPaleolitica, objeto3: Conteudos.conteudosDeEraMesolitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "GEOGRAFIA", icon: Icons.public, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "FILOSOFIA", icon: Icons.psychology, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "SOCIOLOGIA", icon: Icons.group, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "FÍSICA", icon: Icons.tips_and_updates, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "QUÍMICA", icon: Icons.science, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "BIOLOGIA", icon: Icons.biotech, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "PROGRAMAÇÃO", icon: Icons.computer, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                  buildBody(nomeMateria: "NEGÓCIOS", icon: Icons.work, objeto1: Conteudos.conteudosDeGeometriaPlana, objeto2: Conteudos.conteudosDeGeometriaEspacial, objeto3: Conteudos.conteudosDeGeometriaAnalitica),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildSearchFunction({
    required String nome,
    required IconData icon,
  }) {
    return Card(
      color: Color(0xFFB6CCD7),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nome,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Icon(
              icon,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }

  buildBody({
    required String nomeMateria,
    required IconData icon,
    required Conteudos objeto1,
    required Conteudos objeto2,
    required Conteudos objeto3,
  }) {
    return Card(
      color: Color(0xFFB6CCD7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB6CCD7)),
              ),
              onPressed: () =>  onPressed(objeto1, objeto2, objeto3),
              child: Column(
                children: [
                  Text(
                    nomeMateria,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    icon,
                    size: 50,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPressed(Conteudos objeto1, Conteudos objeto2,Conteudos objeto3){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return CardMatematica(objeto1: objeto1, objeto2: objeto2, objeto3: objeto3);
          }
      ),
    );
  }
}
