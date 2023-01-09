import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:app/pages/card/ver_meu_card.dart';

class CardUltimoAcesso extends StatefulWidget {
  final CartaoResumo cartaoResumo;

  const CardUltimoAcesso({
    Key? key,
    required this.cartaoResumo,
  }) : super(key: key);

  @override
  _CardUltimoAcessoState createState() => _CardUltimoAcessoState();
}

class _CardUltimoAcessoState extends State<CardUltimoAcesso> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return VerMeuCard(
                cartaoResumo: widget.cartaoResumo,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(widget.cartaoResumo.titulo, style: const TextStyle(fontSize: 16, color: Color(0xff351b75), fontWeight: FontWeight.bold)),
                  Text(widget.cartaoResumo.descricao, style: const TextStyle(fontSize: 10)),
                ],
              ),
            ),
            buildImage(),
          ],
        ),
      ),
    );
  }

 buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 130,
            height: 107,
            child: Image.network(widget.cartaoResumo.imagem, fit: BoxFit.fill,),
          ),
        ),
      ],
    );
  }
}
