import 'package:app/data/db_helper.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class MusicsDatasApi {

  final String sql = "select * from StudyMusics";
  final String _baseUrl = "studyappapi.fhyvugvfjudgf.repl.co/";

  Future <void> buildDatabase() async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    final queryResult = await db.rawQuery(sql);
    print("Query Result: $queryResult");
    insertMusicDatas(jsonList: queryResult);
  }


  Future<void> insertMusicDatas({required dynamic jsonList}) async {
    /*
       Uri url = Uri.http(_baseUrl, "/cadastrarJSON");
      //Response response = await http.post(url);
      Response response = await http.post(url, jsonList);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        MusicApi().listDatas();
      }
    */
  }
}