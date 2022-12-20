import 'package:app/domain/cartao_resumo.dart';
import 'package:app/data/bd/db_helper.dart';
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
}
