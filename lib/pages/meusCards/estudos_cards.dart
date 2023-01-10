import 'package:app/domain/atributos_card.dart';
import 'package:app/domain/cartao_domain/cartao_resumo.dart';
import 'package:app/pages/meusCards/detalhes_card.dart';
import 'package:flutter/material.dart';

class EstudosCard extends StatefulWidget {
  final CartaoResumo detalhes;

  const EstudosCard({
    Key? key,
    required this.detalhes,
  }) : super(key: key);

  @override
  _EstudosCardState createState() => _EstudosCardState();
}

class _EstudosCardState extends State<EstudosCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CardDetalhes(
                  detalhes: widget.detalhes,
                );
              },
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white54,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.detalhes.titulo,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.detalhes.descricao,
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
            child: Image.network(widget.detalhes.imagem, fit: BoxFit.fill,),
          ),
        ),
      ],
    );
  }
  
}
