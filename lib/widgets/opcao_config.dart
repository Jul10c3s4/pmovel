import 'package:app/domain/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Opcao_config extends StatefulWidget {
  final Conteudo cont;

  const Opcao_config({
    Key? key,
    required this.cont,
  }) : super(key: key);

  @override
  State<Opcao_config> createState() => _Opcao_configState();
}

class _Opcao_configState extends State<Opcao_config> {
  Conteudo get conteudo => widget.cont;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(color: Color(0xFF5B30BF)),
      child: Row(children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, conteudo.rota);
          },
          child: Text(
            conteudo.titulo,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
