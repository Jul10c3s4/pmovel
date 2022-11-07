import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app/data/database_contents.dart';
import 'package:app/data/caller_database.dart';
import 'package:app/data/subject_database.dart';
import 'package:app/domain/conteudos_das_materias.dart';
import 'package:app/pages/card_submateria.dart';

class CardMaterias extends StatefulWidget {
  const CardMaterias({Key? key}) : super(key: key);
  @override
  _CardMaterias createState() => _CardMaterias();
}

class _CardMaterias extends State <CardMaterias> {
  @override

  Widget build(BuildContext context) {

    CallDatabase().buildDatabase();

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
          FutureBuilder(
              future: SubjectDatabaseContents.getSubjectsList(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          buildSearchFunction(lupa: SubjectDatabaseContents.lupa),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: SubjectDatabaseContents.subjects.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 60),
                                    //buildBody(materia: SubjectDatabaseContents.subjects[index], listaMaterias: Request().buildSubjectList(listLength: DatabaseContents.subjects_contents[index].length, appBarName: DatabaseContents.subjects_contents[index][0].titleAppBar)),
                                    //buildBody(materia: SubjectDatabaseContents.subjects[index], listaMaterias: DatabaseContents.subjects_contents[index], title: Request().atributesList[0].titleAppBar),
                                    buildBody(materia: SubjectDatabaseContents.subjects[index], listaMaterias: DatabaseContents.subjects_contents[index]),
                                  ],
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  );
                }
                else{
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(150),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  );
                }
              }
          ),
        ],
      ),
    );
  }

  buildSearchFunction({
    required Search lupa,
  }) {
    return Card(
      color: Color(0xFFB6CCD7),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lupa.name,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Icon(
              lupa.icon,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }

  buildBody({
    //required String title,
    //required IconData icon,
    required Materias materia,
    required List listaMaterias,
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
              onPressed: () =>  onPressed(listaMaterias),
              child: Column(
                children: [
                  Text(
                    materia.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    materia.icon,
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

  onPressed(List listaMaterias){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return CardSubMateria(listaMaterias: listaMaterias);
          }
      ),
    );
  }
}
