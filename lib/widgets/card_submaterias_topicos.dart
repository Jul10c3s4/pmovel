import 'package:flutter/material.dart';
import 'package:untitled4/domain/conteudos_das_materias.dart';
import 'package:untitled4/widget/card_submateria_topicos_assuntos.dart';

class AssuntosDaMateriaTopicalizados extends StatefulWidget {

  final Conteudos objeto;

  AssuntosDaMateriaTopicalizados({
    Key? key,
    required this.objeto,
  }) : super(key: key);

  @override
  _AssuntosDaMateriaTopicalizadosState createState() => _AssuntosDaMateriaTopicalizadosState();
}

class _AssuntosDaMateriaTopicalizadosState extends State<AssuntosDaMateriaTopicalizados>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB6CCD7)),
        ),
        onPressed: () => onPressed(widget.objeto),
        child: Container(
          color: Color(0xFFB6CCD7),
          child: Center(
            child: Column(
              children: [
                Text(
                  '${widget.objeto.titulo}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  widget.objeto.icon,
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
  void onPressed(objeto){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PaginaDeAssuntos(
            nomeClasse: widget.objeto,
          );
        },
      ),
    );
  }
}
