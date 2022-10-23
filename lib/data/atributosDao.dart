
import 'package:app/data/db_helper.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:sqflite/sqflite.dart';

class AtributosDao{

  Future<void> salvarAtributos({required Atributos atributos}) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.insert('CARD', atributos.toJson());
  }

  Future<List<Atributos>> listarAtributos() async{
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM CARD;';
    final result = await db.rawQuery(sql);

    List<Atributos> lista = <Atributos> [];
    for(var json in result){
      Atributos atributos = Atributos.fromJson(json);
      lista.add(atributos);
    }
    return lista;
  }
}