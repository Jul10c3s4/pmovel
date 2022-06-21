import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:app/pages/ver_meu_card.dart';

class CardCartaoResumo extends StatefulWidget {
  final CartaoResumo cartaoResumo;

  const CardCartaoResumo({
    Key? key,
    required this.cartaoResumo,
  }) : super(key: key);

  @override
  _CardCartaoResumoState createState() => _CardCartaoResumoState();
}

class _CardCartaoResumoState extends State<CardCartaoResumo> {
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
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white54,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.cartaoResumo.titulo,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.cartaoResumo.descricao,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
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
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(8),
          ),
          child: Container(
            width: 90,
            height: 70,
            alignment: const Alignment(0.2, 0.6),
            child: Image.network(widget.cartaoResumo.image),
          ),
        ),
      ],
    );
  }
}
