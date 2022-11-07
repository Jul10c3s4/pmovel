import 'package:sqflite/sqlite_api.dart';
import 'package:untitled4/data/DBHelper.dart';

class CallDatabase{

 Future<void> buildDatabase() async{
   Database db = await DBHelper().initDB();
   String sql = "select * from SubjectAtributes";
   final json = await db.rawQuery(sql);
   print(json);
 }
}
