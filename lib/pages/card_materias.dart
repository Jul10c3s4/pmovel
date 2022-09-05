import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/data/database_contents.dart';
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
                  buildSearchFunction(lupa: SubjectDatabaseContents.lupa),
                  //const Divider(height: 60),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.portuguese, listaMaterias: DatabaseContents.portuguese_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.math, listaMaterias: DatabaseContents.maths_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.history, listaMaterias: DatabaseContents.history_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.geografy, listaMaterias: DatabaseContents.geografy_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.philosophy, listaMaterias: DatabaseContents.philosophy_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.sociology, listaMaterias: DatabaseContents.sociology_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.physical, listaMaterias: DatabaseContents.physical_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.chemistry, listaMaterias: DatabaseContents.chemistry_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.biology, listaMaterias: DatabaseContents.biology_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.programming, listaMaterias: DatabaseContents.programming_contents),
                  const SizedBox(height: 60),
                  buildBody(materia: SubjectDatabaseContents.business, listaMaterias: DatabaseContents.business_contents),
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
