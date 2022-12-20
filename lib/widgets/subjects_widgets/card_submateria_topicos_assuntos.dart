import 'package:app/data/bd/subjects_bd/database_contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/subjects_domain/conteudos_das_materias.dart';

class PaginaDeAssuntos extends StatefulWidget {
  final Conteudos nomeClasse;

  PaginaDeAssuntos({
    Key? key,
    required this.nomeClasse,
  }) : super(key: key);

  @override
  _PaginaDeAssuntosState createState() => _PaginaDeAssuntosState();
}

class _PaginaDeAssuntosState extends State<PaginaDeAssuntos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF180C36),
      backgroundColor: const Color(0xFF293462),
      appBar: AppBar(
        backgroundColor: const Color(0xFF224B0C),
        centerTitle: true,
        title: Text(
          widget.nomeClasse.titulo,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: DatabaseContents.getFutureObject(widget.nomeClasse),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return buildPage(objeto: widget.nomeClasse);
          }
        },
      ),
    );
  }

  void onTap() {}

  void onPressed4() {
    Navigator.pop(context);
  }

  buildDesignIcons({
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white70,
        ),
      ],
    );
  }

  buildPage({
    required Conteudos objeto,
  }) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Image.network('${objeto.imagem}'),
                    onTap: onTap,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  //Icons.play_lesson,  Icons.laptop_mac,  Icons.bookmark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildDesignIcons(icon: Icons.play_lesson),
                      buildDesignIcons(icon: Icons.laptop_mac),
                      buildDesignIcons(icon: Icons.bookmark),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '${objeto.conceito}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: onPressed4,
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    //size: 20,
                    backgroundColor: const Color(0xFF224B0C),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Voltar"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
