import 'package:app/data/bd/subjects_bd/database_contents.dart';
import 'package:app/data/bd/subjects_bd/subject_database.dart';
import 'package:app/widgets/subjects_widgets/card_submaterias_topicos.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/subjects_domain/conteudos_das_materias.dart';

class CardSubMateria extends StatefulWidget {
  final List listaMaterias;

  CardSubMateria({
    Key? key,
    required this.listaMaterias,
  }) : super(key: key);

  @override
  _CardSubMateria createState() => _CardSubMateria();
}

class _CardSubMateria extends State<CardSubMateria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E39F5),
      body: ListView(
        children: [
          buildPageAppBar(titleAppBar: widget.listaMaterias[0].titleAppBar),
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
                      Text(
                        "${SubjectDatabaseContents.lupa.name}",
                        style: TextStyle(fontSize: 30),
                      ),
                      Icon(SubjectDatabaseContents.lupa.icon, size: 50),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.listaMaterias.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                        future: getFutureContentList(
                            lista: widget.listaMaterias, index: index),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(80.0),
                                  child: const CircularProgressIndicator(),
                                ),
                              );
                            default:
                              return buildPageContent(
                                  objeto: widget.listaMaterias[index]);
                          }
                        });
                  }),
            ],
          ),
        ],
      ),
    );
  }

  getFutureContentList({
    required List lista,
    required int index,
  }) {
    switch (lista[index].titleAppBar) {
      case "PORTUGUÊS":
        return DatabaseContents.getPortugueseListContents();
      case "MATEMÁTICA":
        return DatabaseContents.getMathListContents();
      case "HISTÓRIA":
        return DatabaseContents.getHistoryListContents();
      case "GEOGRAFIA":
        return DatabaseContents.getGeografyListContents();
      case "FILOSOFIA":
        return DatabaseContents.getphilosophyListContents();
      case "SOCIOLOGIA":
        return DatabaseContents.getSociologyListContents();
      case "FÍSICA":
        return DatabaseContents.getPhysicalListContents();
      case "QUÍMICA":
        return DatabaseContents.getPortugueseListContents();
      case "BIOLOGIA":
        return DatabaseContents.getBiologyListContents();
      case "PROGRAMAÇÃO":
        return DatabaseContents.getProgrammingListContents();
      default:
        return DatabaseContents.getBussinessListContents();
    }
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
    required Conteudos objeto,
  }) {
    return Column(
      children: [
        const SizedBox(height: 60),
        AssuntosDaMateriaTopicalizados(
          objeto: objeto,
        ),
      ],
    );
  }
}
