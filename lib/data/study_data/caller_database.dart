import 'package:app/data/db_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class CallDatabase{

  Future<void> buildDatabase() async{
    Database db = await DB_Helper().initDB();
    String sql = "select * from SubjectAtributes";
    final json = await db.rawQuery(sql);
    print(json);
  }

}