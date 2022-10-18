import 'package:app/domain/cartao_resumo.dart';

class CartaoDao {
  Future<void> salvarCartaoResumo({required CartaoResumo cartaoResumo}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    await db.insert('cartaoResumo', cartaoResumo.toJson());
  }

  listarCartoes() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM cartaoResumo;';
    final result = await db.rawQuery(sql);

    List<CartaoResumo> lista = <CartaoResumo>[];
    for (var json in result) {
      CartaoResumo cartao = CartaoResumo.fromJson(json);
      lista.add(cartao);
    }

    return lista;
  }
}