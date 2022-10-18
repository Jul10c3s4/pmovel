import 'package:app/data/atributosDao.dart';
import 'package:app/data/db_helper.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  AtributosDao atributosDao = AtributosDao();
  List<Atributos> lista = [];

    initState(){
      super.initState();
      _getAllAtributos();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('teste'),
          centerTitle: true,
          backgroundColor: Colors.purple.shade800,
        ),
        backgroundColor: Colors.purple,
        body:
            buildListView(),
        );
  }

  buildListView() {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 10,),
                    buildListtile(context, index)
                  ],
                );
              });
        }

  void _getAllAtributos() {
    atributosDao.listarAtributos().then((list){
      setState(() {
        lista = list;
        print('oi');
      });
    });
  }

  buildListtile(BuildContext context, int index) {
    return ListTile(
      leading: Text('${lista[index].materia}'),
      title: Text('${lista[index].titulo}'),
      subtitle: Text('${lista[index].descricao}'),
      tileColor: Colors.purple.shade400,
      hoverColor: Colors.white,
    );
  }

}
