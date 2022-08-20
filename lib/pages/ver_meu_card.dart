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
                    Row(
                      children: [
                        Text(
                          widget.cartaoResumo.titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.bookmark_outline),
                        const Icon(Icons.edit),
                      ],
                    ),
                    /*Text(
                      widget.cartaoResumo.materia,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    const SizedBox(width: 12),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6C2C81),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.cartaoResumo.descricao,
                        style: const TextStyle(
                          color: Color(0xFFAF66F9),
                          fontSize: 16,
                        ),
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
