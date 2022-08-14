import 'package:flutter/material.dart';
import 'package:app/widgets/nav_drawer.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:app/widgets/cartao_resumo_card.dart';
import 'package:app/widgets/ultimo_acesso_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

// BD.cardatabase
class _ExplorePageState extends State<ExplorePage> {
  //List<CartaoResumo> database = BD.database;
  CartaoResumo cartao1 = CartaoResumo(
      image:
      'https://www.historiadetudo.com/wp-content/uploads/2015/03/era-napoleonica.jpg',
      titulo: 'HISTÓRIA - Era Napoleônica',
      descricao:
      'Em vingança a decisão do Czar Alexandre I, o governo napoleônico decidiu invadir a Rússia em 1812. Os generais acostumados com grandes vitórias...');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.1,
        ),
          itemCount: 1 /*database.length*/,
          itemBuilder: (BuildContext context, int index ){
            return CardUltimoAcesso(cartaoResumo: cartao1);
          },
          ),
      ),
    );
  }
}
