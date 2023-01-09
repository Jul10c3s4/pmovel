import 'package:app/data/DAO/cartaoDao.dart';
import 'package:app/pages/ygor/jogos_page.dart';
import 'package:app/widgets/ultimo_acesso_card.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/cartao_domain/cartao_resumo.dart';
import 'package:app/pages/card/new_card.dart';
import 'package:app/widgets/cartao_resumo_card.dart';
import 'package:app/data/DAO/cartaoDao.dart';

class DestaquePage extends StatefulWidget {
  const DestaquePage({Key? key}) : super(key: key);

  @override
  State<DestaquePage> createState() => _DestaquePageState();
}

class _DestaquePageState extends State<DestaquePage> {
  Future<List<CartaoResumo>> lista = CartaoDao().listarCartoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6239db),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Column(
            children: [
              const ListTile(
                leading: Icon(Icons.access_time, color: Colors.white),
                title: Text(
                  'Último acesso',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              buildUltimoAcesso(),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.favorite, color: Colors.white),
                  title: Text(
                    'Seus cards',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                buildListView()
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onPressedButton,
                  child: const Text(
                    'ADICIONAR NOVO CARD',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: const EdgeInsets.all(5.0),
              color: Colors.black,
              child: ElevatedButton(
                onPressed: onPressedButton2,
                child: const Text(
                  'JOGOS INTERATIVOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff180c36),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const NewCard();
        },
      ),
    );
  }

  void onPressedButton2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return JogosPage();
        },
      ),
    );
  }

  buildUltimoAcesso() {
    return FutureBuilder<List<CartaoResumo>>(
      future: lista,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CartaoResumo> lista = snapshot.data ?? [];

          return CardCartaoResumo(cartaoResumo: lista[1]);
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }

  buildListView() {
    return FutureBuilder<List<CartaoResumo>>(
      future: lista,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CartaoResumo> lista = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return CardCartaoResumo(cartaoResumo: lista[index]);
            },
          );
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
