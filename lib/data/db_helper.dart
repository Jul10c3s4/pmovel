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
    
    String sqlCreateMusic;
    sqlCreateMusic = "CREATE TABLE StudyMusics(id int PRIMARY KEY,name varchar(100),link varchar(200), imageLink varchar(200))";
    await db.execute(sqlCreateMusic);
    sqlCreateMusic = "create table DrawerGenres(id int PRIMARY KEY, genreName varchar(100), musicName varchar(60), musicSinger varchar(60), linkMusicWallpaper varchar(100), youtubeURL varchar(100))";
    await db.execute(sqlCreateMusic);
    await insertIntoTables(db);
    
    String sqlMusic;
    String sqlGenre;
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (0,'Come and Go', 'https://youtu.be/SjGVvdq9ZCs', 'https://i0.wp.com/br.nacaodamusica.com/wp-content/uploads/2020/07/Juice-WRLD.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (1,'Tipo Madara', 'https://youtu.be/wCMzj9Gzyt0?list=RDMM', 'https://images3.alphacoders.com/695/695428.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (2,'After Party', 'https://youtu.be/GyR38LqBWEE?list=RDMM', 'https://i1.sndcdn.com/artworks-MUe0sOoezI9ORG2U-YTIzhA-t500x500.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (3,'Feel Like God', 'https://youtu.be/Rxu-SeaLmlo?list=RDMM', 'https://i.ytimg.com/vi/kw-XWS1Usio/sddefault.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (4,'Drunk and Nasty', 'https://youtu.be/3T5rSK0rd7k?list=RDMM', 'https://m.media-amazon.com/images/I/71iG4caogJL._SS500_.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (5,'Vibe Zabuza', 'https://youtu.be/x6VWj8JeyIU?list=RDMM', 'https://besthqwallpapers.com/Uploads/6-12-2019/114238/thumb2-zabuza-momochi-4k-naruto-characters-momochi-zabuza-manga.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (6,'Rick and Morty', 'https://youtu.be/br8qyUSbuDI', 'https://static.itapemafm.com.br/s3fs-public/styles/itapema_blog_post_header/public/graphql-upload-files/rick%20and%20morty%20temporada%205_1.jpg');";
    await db.execute(sqlMusic);

    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (0, 'Lofi', 'Lofi Hip Hop', 'Instrumental', 'https://c4.wallpaperflare.com/wallpaper/908/34/383/lofi-digital-anthro-hd-wallpaper-preview.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (1, 'Hip Hop', 'Yeat - Already Rich', 'Remix', 'https://images.alphacoders.com/998/thumb-1920-998446.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (2, 'Pop', 'Cheerleader', 'Felix Jaehn', 'https://upload.wikimedia.org/wikipedia/commons/6/6e/JU_Cheerleaders.jpg', 'https://youtu.be/rXF9ziZ3AU4?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (3, 'Electronic', 'Electronic', 'Instrumental', 'https://c4.wallpaperflare.com/wallpaper/908/34/383/lofi-digital-anthro-hd-wallpaper-preview.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (4, 'Hip Hop', 'Lucid Dreams', 'Juice WRLD', 'https://i.pinimg.com/736x/09/f8/f3/09f8f3fe8f6020afd034531d78a7637f.jpg', 'https://youtu.be/mzB1VGEGcSU?list=PLDUJWPwQe9iOVT5Y1WEL3E7kHOBTGiCvW')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (5, 'Pop', 'I Really Like to Party', 'Remix', 'https://files.musicfeed.ir/photoes/1400/08/i-really-like-to-party.jpg', 'https://youtu.be/o6jZo5ub3hw?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (6, 'Electronic', 'Better Now', 'Post Malone', 'https://i1.sndcdn.com/artworks-000583785761-cnd2zw-t500x500.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    
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
