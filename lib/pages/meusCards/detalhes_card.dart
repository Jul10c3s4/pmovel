import 'package:app/domain/atributos_card.dart';
import 'package:app/data/bd/cartaoDao.dart';
import 'package:app/domain/cartao_resumo.dart';
import 'package:flutter/material.dart';

class CardDetalhes extends StatefulWidget {
  final CartaoResumo detalhes;

  const CardDetalhes({
    Key? key,
    required this.detalhes,
  }) : super(key: key);

  @override
  _CardDetalhesState createState() => _CardDetalhesState();
}

class _CardDetalhesState extends State<CardDetalhes> {
  Future<List<CartaoResumo>> lista = CartaoDao().listarCartoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff180c36),
        title: const Text('MEUS CARDS'),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Wrap(
                      spacing: 30.0,
                      children: [
                        Text(
                          widget.detalhes.titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //const SizedBox(width: 6.0),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('Matéria'),
                Icon(Icons.expand_more_outlined),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'DESCRIÇÃO',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  color: const Color(0xff6239db),
                  borderRadius: BorderRadius.circular(10)),
              height: 150,
              child: Text(
                widget.detalhes.descricao,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            //buildImage(),
          ],
        ),
      ),
    );
  }
}
