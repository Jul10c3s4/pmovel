import 'package:app/data/atributosDao.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/meusCards/detalhes_card.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:app/pages/meusCards/assunto_page.dart';
import 'package:app/pages/meusCards/estudos_cards.dart';
import 'package:app/widgets/nav_drawer.dart';

class MeuCard extends StatefulWidget {
  const MeuCard({Key? key}) : super(key: key);

  @override
  _MeuCardState createState() => _MeuCardState();
}

class _MeuCardState extends State<MeuCard> {
  Future<List<Atributos>> lista = AtributosDao().listarAtributos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF180C36),
        title: const Text(
          'MEUS CARDS',
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: const Color(0xff6239db),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Aqui estão seus cards',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            buildListView()
          ],
        )
      ),
    );
  }

  buildListView() {
    return FutureBuilder<List<Atributos>>(
      future: lista,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Atributos> lista = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lista.length,
            itemBuilder: (BuildContext context, int index) {
              return EstudosCard(detalhes: lista[index]);
            },
          );
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const AssuntoPage();
        },
      ),
    );
  }
}
