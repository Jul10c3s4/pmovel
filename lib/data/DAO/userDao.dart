import 'package:app/data/bd/db_helper.dart';
import 'package:app/domain/user_domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao{

  Future<void> salvarUser({required User user}) async{
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.insert('USER', user.toJson());
  }

  Future<bool> autenticar({required String userEmail, required String password}) async{
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM USER WHERE userEmail = ? AND password = ?;';

    final result = await db.rawQuery(sql, [userEmail, password]);

    return result.isNotEmpty;
  }

  Future<List<User>> listarUsers() async{
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM USER;';
    final result = await db.rawQuery(sql);

    List<User> lista = <User> [];
    for(var json in result){
      User user = User.fromJson(json);
      lista.add(user);
    }
    return lista;
  }

}