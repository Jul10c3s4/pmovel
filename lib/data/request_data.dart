import 'package:sqflite/sqlite_api.dart';
import 'package:untitled4/domain/json_data.dart';

class Request{

  List atributesList = [];

  Future<void>  fullFillObjects({
    required Database db,
    required int count,
    required List <Json> list,
  }) async {
    String sql;
    sql = 'SELECT * '
        'FROM SubjectAtributes '
        "WHERE id = ?; ";
    final subject = await db.rawQuery(sql, [count]);
    //print(subject);
    Json objectSub = Json.fromJson(subject[0]);
    list.add(objectSub);
    atributesList.add(list[count]);
    print(objectSub);
    print(list[count].titleAppBar);
  }

  Future <List> buildSubjectList({
    required listLength,
    required String appBarName,
    required Database db,
  }) async {
    List list = [];
    String sql;
    dynamic queryResult;
    sql = "SELECT *"
        "FROM SubjectAtributes"
        "WHERE appBarName = ?;";

    //depois de recuperar, deve-se converter os argumentos do json para os atributos
    for (var i = 0; i < listLength; i++) {
      queryResult = await db.rawQuery(sql, [appBarName]);
      list.add(queryResult[0]);
    }

    return list; //nesse retorno, voce os atributos dos objetos inseridos nela ja devem estar convertidos do json
  }
}
