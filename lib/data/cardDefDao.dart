import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import '../data/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../data/sharedPreferences.dart';
import '../domain/cartaoDefinitivo.dart';

class CardDefDao {
  Future<List<CardDef>> listarCardsD() async {
    DB_Helper dhb = new DB_Helper();
    Database db = await dhb.initDB();

    String sql = "SELECT (titulo, descricao) FROM CARD;";
    //id INTEGER KEY, materia varchar(100), titulo varchar(100), descricao TEXT
    final result = await db.rawQuery(sql);

    print(result);

    List<CardDef> listaCD = <CardDef>[];
    for (var json in result) {
      CardDef c = CardDef.fromJson(json);
      listaCD.add(c);
    }

    for (var cardD in listaCD) {
      print(cardD.toString());
    }

    return listaCD;
  }
}
