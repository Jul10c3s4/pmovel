import 'package:app/data/bd/db_helper.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:app/domain/cartao_domain/cartaoDefinitivo.dart';
import 'package:sqflite/sqflite.dart';

//import 'dart:convert';

class AtributosDao {
  Future<void> salvarAtributos({required Atributos atributos}) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.insert('CARD', atributos.toJson());
  }

  Future<List<Atributos>> listarAtributos() async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM CARD;';
    final result = await db.rawQuery(sql);

    List<Atributos> lista = <Atributos>[];
    for (var json in result) {
      Atributos atributos = Atributos.fromJson(json);
      lista.add(atributos);
      //json.encode(json) AS Map<String, dynamic>
    }

    return lista;
  }

  static Future<List<CardDef>> listarCardDef() async {
    DB_Helper dbHelper = new DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM CARD;';
    final result = await db.rawQuery(sql);

    List<CardDef> lista = <CardDef>[];

    for (var json in result) {
      CardDef c = new CardDef.fromJson(json);
      lista.add(c);
      //json.decode(json) AS Map<String, dynamic>
    }

    return lista;
  }
}
