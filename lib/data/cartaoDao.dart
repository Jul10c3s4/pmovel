import 'package:app/domain/cartao_resumo.dart';
import 'package:app/data/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class CartaoDao {
  Future<void> salvarCartaoResumo({required CartaoResumo cartaoResumo}) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.insert('CARD', cartaoResumo.toJson());
  }

  Future<List<CartaoResumo>> listarCartoes() async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM CARD;';
    final result = await db.rawQuery(sql);

    List<CartaoResumo> lista = <CartaoResumo>[];
    for (var json in result) {
      CartaoResumo cartaoResumo = CartaoResumo.fromJson(json);
      lista.add(cartaoResumo);
    }
    return lista;
  }

  Future<CartaoResumo> GetCard({required CartaoResumo cartaoResumo}) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();
    //final maps = await db.query(tableName, where: '_id = ?', whereArgs: [id]);
    final card = await db.query("CARDS",
        where: 'descricao = ?', whereArgs: [cartaoResumo.descricao]);

    CartaoResumo carde = CartaoResumo.fromJson(card[0]);
    return carde;
  }

  Future<void> AtualizarCartao({required CartaoResumo cartaoResumo}) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.update('CARD', cartaoResumo.toJson(),
        where: 'descricao = ?', whereArgs: [cartaoResumo.descricao]);
  }

  Future<void> ExcluirCartao({required CartaoResumo cartaoResumo}) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.delete("CARD",
        where: 'descricao = ?', whereArgs: [cartaoResumo.descricao]);

    /*('CARD', cartaoResumo.toJson(),
    where: 'descricao = ?',
    whereArgs: [cartaoResumo.descricao]
    );*/
  }
}
