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
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.cartaoResumo.titulo,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.cartaoResumo.descricao,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 24),
                    buildImage(),
                  ],
                ),
              ),
            ),
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
