import 'package:app/data/db_helper.dart';
import 'package:app/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao{

  Future<void> salvarUser({required User user}) async{
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.insert('USER', user.toJson());
  }

  Future<bool> autenticar({required String username, required String password}) async{
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM USER WHERE username = ? AND password = ?;';

    final result = await db.rawQuery(sql,[username, password]);

    return result.isNotEmpty;
  }
      

}