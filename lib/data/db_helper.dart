import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DB_Helper{

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "card.db");

    Database database = await openDatabase(
      path, 
      version: 1, 
      onCreate: onCreate;
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async{

    String sqlUser = "CREATE TABLE USER(userEmail varchar(100) PRIMARY KEY, userName varchar(100), password varchar(100))";
      await db.execute(sqlUser);

    sqlUser = "INSERT INTO USER(userName, userEmail, password) VALUES ('aluno', 'aluno@gmail.com', '123456')";
      await db.execute(sqlUser);

    String sqlCard = 
    'create table CARD(id INTEGER KEY, materia varchar(100), titulo varchar(100), descricao TEXT);';
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('HISTÓRIA', 'Era Napoleônica', 'Em vingança a decisão do Czar Alexandre I, o governo napoleônico decidiu invadir a Rússia em 1812. Os generais acostumados com grandes vitórias...');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('GEOGRAFIA', 'Geopolítica', 'A geopolítica mundial evoluiu para incluir as dinâmicas populacionais e econômicas dentro deste jogo de poder, no tabuleiro político internacional...');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('MATEMÁTICA', 'Conjuntos', 'Conjuntos numéricos são ..., A partir deles podemos definir interseções, uniões e manipular-los, no geral.');";
    await db.execute(sqlCard);

    sqlCard = 
    "INSERT INTO CARD(materia, titulo, descricao) VALUES ('HISTORIA', '1º Guerra Mundial', 'A Primeira Guerra Mundial foi um conflito bélico global centrado na Europa, que começou em 28 de julho de 1914 e durou até 11 de...');";
    await db.execute(sqlCard);
  }
}
