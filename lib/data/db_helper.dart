import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app/data/database_contents.dart';
import 'package:app/data/request_data.dart';
import 'package:app/domain/json_data.dart';

class DB_Helper{

  static List subjectList = DatabaseContents.subjects_contents;

  static int portugueseLength = DatabaseContents.portuguese_contents.length;
  static int mathsLength = DatabaseContents.maths_contents.length;
  static int historyLength = DatabaseContents.history_contents.length;
  static int geografyLength = DatabaseContents.geografy_contents.length;
  static int philosophyLength = DatabaseContents.philosophy_contents.length;
  static int sociologyLength = DatabaseContents.sociology_contents.length;
  static int physicalLength = DatabaseContents.physical_contents.length;
  static int chemistryLenght = DatabaseContents.chemistry_contents.length;
  static int biologyLenght = DatabaseContents.biology_contents.length;
  static int programmingLenght = DatabaseContents.programming_contents.length;
  static int businessLenght = DatabaseContents.business_contents.length;

  static int totalLenght = portugueseLength + mathsLength + historyLength + geografyLength + philosophyLength + sociologyLength + physicalLength + chemistryLenght + biologyLenght + programmingLenght + businessLenght;

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "card.db");

    Database database = await openDatabase(
      path,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sqlUser =
        "CREATE TABLE USER(username varchar(100) PRIMARY KEY, password varchar(100))";
    await db.execute(sqlUser);

    sqlUser =
        "INSERT INTO USER(username, password) VALUES ('aluno@gmail.com', '123456')";
    await db.execute(sqlUser);

    String sqlCard =
        'create table CARD(id INTEGER KEY, materia varchar(100), titulo varchar(100), descricao TEXT);';
    await db.execute(sqlCard);

    sqlCard =
        "INSERT INTO CARD(materia, titulo, descricao,) VALUES ('HISTÓRIA', 'Era Napoleônica', 'Em vingança a decisão do Czar Alexandre I, o governo napoleônico decidiu invadir a Rússia em 1812. Os generais acostumados com grandes vitórias...');";
    await db.execute(sqlCard);

    sqlCard =
        "INSERT INTO CARD(materia, titulo, descricao,) VALUES ('GEOGRAFIA', 'Geopolítica', 'A geopolítica mundial evoluiu para incluir as dinâmicas populacionais e econômicas dentro deste jogo de poder, no tabuleiro político internacional...');";
    await db.execute(sqlCard);

    sqlCard =
        "INSERT INTO CARD(materia, titulo, descricao,) VALUES ('MATEMÁTICA', 'Conjuntos', 'Conjuntos numéricos são ..., A partir deles podemos definir interseções, uniões e manipular-los, no geral.');";
    await db.execute(sqlCard);

    sqlCard =
        "INSERT INTO CARD(materia, titulo, descricao,) VALUES ('HISTORIA', '1º Guerra Mundial', 'A Primeira Guerra Mundial foi um conflito bélico global centrado na Europa, que começou em 28 de julho de 1914 e durou até 11 de...');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('PORTUGUÊS', 'MEU PRIMEIRO TESTE', 'textotextotextotextotextotextotextotextotextotextotextotextotextotexto...');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('PORTUGUÊS', 'Conjunções subordinadas', 'As conjunções subordinativas são termos que ligam duas orações sintaticamente dependentes...');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('LÓGICA DE PROGRAMAÇÃO', 'Linguagem HTML', 'HTML é o componente base da web. Isso quer dizer que ele permite a construção de websites e a inserção de novos conteúdos, como imagens e vídeos, por meio dos hipertextos...');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('PORTUGUÊS', 'Formatação de Texto', 'segundo a norma ABNT, os textos devem estar em formato justificado, na fonte Arial ou Times New Romans tamanho 10 ou 12, com espaçamento de 1,5 entre as linhas...');";
    await db.execute(sqlCard);

    String sql = "create table SubjectAtributes(id INTERGER PRIMARY KEY, title varchar(40), iconName varchar(40),  titleAppBar varchar(40), imageLink varchar(300), concept varchar(500))";
    await db.execute(sql);
    await insertIntoDatas(db: db, totalLength: totalLenght);    

    Future<FutureOr<void>> insertIntoDatas({
    required Database db,
    required int totalLength,
    }) async{
      List <Json> objectsSubList = [];
      String sql;
      int count = 0;

      for (var i in subjectList) {
        for (var j in i) {
          sql = "insert into SubjectAtributes(id, title, iconName, titleAppBar, imageLink, concept) VALUES ('$count', '${j.titulo}', '${j.icon}', '${j.titleAppBar}', '${j.imagem}', '${j.conceito}');";
          await db.execute(sql);
          Request().fullFillObjects(db: db, count: count, list: objectsSubList);
          count++;
        }
      }
    }
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      //ESTATISTICAS é uma entidade fraca
      String sql =
          "CREATE TABLE ESTATISTICAS(username_FK varchar(100), qVitorias integer,qJogos integer,);";
      await db.execute(sql);

      sql =
          "ALTER TABLE ESTATISTICAS ADD CONSTRAINT usrName_FK FOREIGN KEY (username_FK) REFERENCES USER(username);";

      await db.execute(sql);

      sql = "INSERT INTO ESTATISTICAS VALUES('aluno@gmail.com', 0, 0);";
      await db.execute(sql);
    }
  }
}
