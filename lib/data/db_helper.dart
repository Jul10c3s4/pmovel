import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DB_Helper{

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

  Future<FutureOr<void>> onCreate(Database db, int version) async{

    String sqlUser = "CREATE TABLE USER(username varchar(100) PRIMARY KEY, password varchar(100))";
      await db.execute(sqlUser);

    sqlUser = "INSERT INTO USER(username, password) VALUES ('aluno@gmail.com', '123456')";
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
  }


    Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1 && newVersion == 2){
      
      //ESTATISTICAS é uma entidade fraca
      String sql = "CREATE TABLE ESTATISTICAS(
        username_FK varchar(100),
        qVitorias integer,
        qJogos integer,);
        ";
      await db.execute(sql);

      sql = "ALTER TABLE ESTATISTICAS
        ADD CONSTRAINT usrName_FK 
        FOREIGN KEY (username_FK)
        REFERENCES USER(username);
        ";

      await db.execute(sql);

      sql = "INSERT INTO ESTATISTICAS
        VALUES('aluno@gmail.com', 0, 0);";
      await db.execute(sql);

      //tenta salvar no banco o estado do jogo 
      sql = "CREATE TABLE FCHP_STATE(
        card_id_FK integer,
        card_space varchar(100),);
        ";

      await db.execute(sql);

      sql = "ALTER TABLE FCHP_STATE
        ADD CONSTRAINT card_FK 
        FOREIGN KEY card_id_FK
        REFERENCES CARD(id);";

      await db.execute(sql);








    }
  }
}