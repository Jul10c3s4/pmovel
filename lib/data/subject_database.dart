import 'package:flutter/material.dart';
import 'package:app/domain/conteudos_das_materias.dart';

class SubjectDatabaseContents{

    static Search lupa = Search("PESQUISAR", Icons.search);

    static Materias portuguese = Materias("PORTUGUÊS", Icons.menu_book);
    static Materias math = Materias("MATEMÁTICA", Icons.functions);
    static Materias history = Materias("HISTÓRIA", Icons.hourglass_empty);
    static Materias geografy = Materias("GEOGRAFIA", Icons.public);
    static Materias sociology = Materias("SOCIOLOGIA", Icons.psychology);
    static Materias philosophy = Materias("FILOSOFIA", Icons.group);
    static Materias physical = Materias("FÍSICA", Icons.tips_and_updates);
    static Materias chemistry = Materias("QUÍMICA", Icons.science);
    static Materias biology = Materias("BIOLOGIA", Icons.biotech);
    static Materias programming = Materias("PROGRAMAÇÃO", Icons.computer);
    static Materias business = Materias("NEGÓCIOS", Icons.work);

    static List<Materias> subjects = [
        portuguese,
        math,
        history,
        geografy,
        sociology,
        philosophy,
        physical,
        chemistry,
        biology,
        programming,
        business,
    ];

    static Future <List<Materias>> getSubjectsList() async{
        await Future.delayed(const Duration(seconds: 5));
        return  subjects;
    }

}
