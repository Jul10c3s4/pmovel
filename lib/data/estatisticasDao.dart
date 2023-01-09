import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'bd/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../data/sharedPreferences.dart';

class EstatisticasDao {
  static Future<int> getQJogos(String username) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql =
        "SELECT (qJogos, qVitorias) FROM ESTATISTICAS E WHERE E.username_FK = ?;";
    final result = await db.rawQuery(sql, [username]);

    print(result.toString());

    int n = 0;
    for (var json in result) {
      n = int.parse(json["qJogos"].toString());
      break;
    }
    return n;
  }

  static Future<int> getQVitorias(String username) async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql =
        "SELECT (qJogos, qVitorias) FROM ESTATISTICAS E WHERE E.username_FK = ?;";
    final result = await db.rawQuery(sql, [username]);

    int n = 0;
    for (var json in result) {
      n = int.parse(json["qVitoria"].toString());
      break;
    }
    return n;
  }

  static Future<void> resetarEstatisticas() async {
    SharedPrefsHelper sph = new SharedPrefsHelper();
    String usernameLogado = await sph.getUserName();
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();
    String sql =
        "SELECT username_FK FROM ESTATISTICAS E WHERE E.username_FK = ?";
    final result = await db.rawQuery(sql, [usernameLogado]);
    if (result.isNotEmpty) {
      sql =
          "DELETE FROM ESTATISTICAS E WHERE E.username_FK = ${usernameLogado}";
      db.execute(sql);

      sql = "INSERT INTO ESTATISTICAS VALUES (?, 0, 0);";
      db.execute(sql, [usernameLogado]);
    }
  }

  static Future<void> espelharUSERcomESTATISTICS() async {
    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    String sql =
        "SELECT (username) FROM USER U LEFT JOIN ESTATISTICAS E ON KEY U.username = E.username_FK WHERE E.username_FK = NULL";
    final resultMirror = await db.rawQuery(sql);

    List<String> listaUserNames = <String>[];
    //for usernames ->
    for (int i = 0; i < resultMirror.length; i++) {
      String usernames = resultMirror[i]["username"].toString();
      listaUserNames.add(usernames);
    }

    sql =
        "INSERT INTO ESTATISTICAS (username_FK, qVitorias, qJogos) VALUES (?, 0, 0);";
    for (int i = 0; i < listaUserNames.length; i++) {
      db.execute(sql, [listaUserNames[i]]);
    }
  }

  static Future<void> registrarJogo(String username, bool vitoria) async {
    int qJ = await EstatisticasDao.getQJogos(username);
    qJ++;
    String sql = "UPDATE  ESTATISTICAS SET qJogos = ? WHERE E.username_FK = ?;";

    DB_Helper dbHelper = DB_Helper();
    Database db = await dbHelper.initDB();

    await db.execute(sql, [qJ, username]);

    if (vitoria) {
      int qV = await EstatisticasDao.getQVitorias(username);
      qV++;

      sql = "UPDATE  ESTATISTICAS SET qVitorias = ? WHERE E.username_FK = ?;";
      await db.execute(sql, [qV, username]);
    }
  }
}
