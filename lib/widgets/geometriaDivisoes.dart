import 'package:flutter/material.dart';
import 'package:app/pages/topicosMatematica.dart';
import 'package:app/domain/atributos_conteudos_geometrias';

class GeometriasDivisoes extends StatefulWidget {

  final String texto;
  final IconData icone;
  final Conteudos classe;

  GeometriasDivisoes({
    Key? key,
    required this.texto,
    required this.icone,
    required this.classe,
  }) : super(key: key);

  @override
  _GeometriasDivisoesState createState() => _GeometriasDivisoesState();
}

class _GeometriasDivisoesState extends State<GeometriasDivisoes>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB6CCD7)),
        ),
        onPressed: onPressed,
        child: Container(
          color: Color(0xFFB6CCD7),
          child: Center(
            child: Column(
              children: [
                Text(
                  '${widget.texto}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  widget.icone,
                  size: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PaginaDeConteudos(
            nomeClasse: widget.classe,
          );
        },
      ),
    );
  }
}
