import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'package:sqflite/sqflite.dart';
import '../pages/pergunta1.dart';
import '../pages/pergunta2.dart';
import '../pages/jogo_memoria.dart';
import '../domain/half_card.dart';
import '../domain/cartaoDefinitivo.dart';
import '../data/bd.dart';
import '../widget/selection_cardH_dialog.dart';
import '../data/estatisticasDao.dart';
import '../data/db_helper.dart';
import '../data/sharedPreferences.dart';

class EstatisticasPage extends StatefulWidget {
  @override
  _EstatisticasPageState createState() => _EstatisticasPageState();
}

class _EstatisticasPageState extends State<EstatisticasPage> {
  Future<int> qJogos = EstatisticasDao.getQJogos('aluno@gmail.com');
  Future<int> qVitorias = EstatisticasDao.getQVitorias("aluno@gmail.com");

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estatisticas"),
        backgroundColor: Color(0xFF180C36),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0C3F1),
              ),
              height: 100,
              child: Column(
                children: [
                  Text(
                    "JOGOS JOGADOS:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  FutureBuilder<int>(
                      future: qJogos,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == true) {
                          int n = snapshot.data ?? -1;

                          return Text(
                            n.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          );
                        }

                        return const CircularProgressIndicator();
                      }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6E39F5),
                ),
                padding: EdgeInsets.all(16),
                //margin: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Text(
                      "JOGOS VENCIDOS:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD0C3F1)),
                    ),
                    SizedBox(height: 16),
                    FutureBuilder<int>(
                        future: qVitorias,
                        builder: (context, snapshot) {
                          if (snapshot.hasData == true) {
                            int n = snapshot.data ?? -1;

                            return Text(
                              n.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFD0C3F1),
                              ),
                            );
                          }

                          return const CircularProgressIndicator();
                        }),
                    /*
                    Text(
                      qVitorias.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFD0C3F1),
                      ),
                    ),
                    */
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD0C3F1),
              ),
              padding: EdgeInsets.all(16),
              height: 100,
              child: Row(
                children: [
                  RaisedButton(
                    onPressed: () async {
                      await EstatisticasDao.resetarEstatisticas();
                    },
                    child: Text("reset statistics"),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      SharedPrefsHelper sph = new SharedPrefsHelper();
                      String usrName = await sph.getUserName();
                      await EstatisticasDao.registrarJogo(usrName, true);

                      setState(() {});
                    },
                    child: Text("win"),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      SharedPrefsHelper sph = new SharedPrefsHelper();
                      String usrName = await sph.getUserName();
                      await EstatisticasDao.registrarJogo(usrName, false);

                      setState(() {});
                    },
                    child: Text("lose"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<int> esperaERetorna(int n) async {
  await Future.delayed(const Duration(seconds: 5));
  return n;
}

//mostra um AlertDialog com um ListView.builder()
//que mostra todos os cards na mão pede para selecionar os cards
//que serão escolhidos
