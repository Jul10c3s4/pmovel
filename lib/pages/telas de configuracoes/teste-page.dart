import 'package:app/data/atributosDao.dart';
import 'package:app/data/bd/db_helper.dart';
import 'package:app/domain/atributos_card.dart';
import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  AtributosDao atributosDao = AtributosDao();
  Future<List<Atributos>> lista = AtributosDao().listarAtributos();

    /*initState(){
      super.initState();
      _getAllAtributos();
    }*/
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
            ListView(
              children: [
                buildListView(),
              ],
            )
        );
  }

  buildListView() {
    return FutureBuilder<List<Atributos>> (
        future: lista,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Atributos> lista = snapshot.data ?? [];
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lista.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      buildListtile(lista[index])
                    ],
                  );
                });
          }
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        });

        }

  /*void _getAllAtributos() {
    atributosDao.listarAtributos().then((list){
      setState(() {
        lista = list;
        print('oi');
      });
    });
  }*/

  buildListtile(Atributos atributos) {
    return ListTile(
      leading: Text('${atributos.materia}'),
      title: Text('${atributos.titulo}'),
      subtitle: Text('${atributos.descricao}'),
      tileColor: Colors.white,
      hoverColor: Colors.white,
    );
  }

}
