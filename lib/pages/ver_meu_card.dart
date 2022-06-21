import 'package:flutter/material.dart';
import 'package:app/domain/cartao_resumo.dart';

class VerMeuCard extends StatefulWidget {
  final CartaoResumo cartaoResumo;
  //final UltimoAcesso ultimoAcesso;

  const VerMeuCard({Key? key, required this.cartaoResumo
      //required this.ultimoAcesso,
      })
      : super(key: key);

  @override
  _VerMeuCardState createState() => _VerMeuCardState();
}

class _VerMeuCardState extends State<VerMeuCard> {
  CartaoResumo get pacote => widget.cartaoResumo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.grey[200],
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
                      fontSize: 18,
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
            width: 200,
            height: 300,
            child: Image.network(widget.cartaoResumo.image),
          ),
        ),
      ],
    );
  }
}
