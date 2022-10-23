import 'package:app/data/cartaoDao.dart';
import 'package:app/widgets/cartao_resumo_card.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';
//import 'package:app/widgets/cartao_resumo_card.dart';
import 'package:app/widgets/ultimo_acesso_card.dart';
import 'package:app/data/cartaoDao.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Future<List<CartaoResumo>> lista = CartaoDao().listarCartoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7940FF).withOpacity(0.5),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: buildGridView(),
      ),
    );
  }
  buildGridView() {
    return FutureBuilder<List<CartaoResumo>>(
      future: lista,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CartaoResumo> lista = snapshot.data ?? [];

          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 2,
              childAspectRatio: 2.2,
            ),
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index) {
              return CardUltimoAcesso(cartaoResumo: lista[index]);
            },
          );
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
